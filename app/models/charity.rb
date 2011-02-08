require 'net/http'
require 'uri'

class Charity < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true,
    :length => {:maximum => 99}
  validates :description,
    :length => {:maximum => 999}
  validates_each :site, :logo do |model, attr, value|
    if !value || value.empty?
      next
    end
    validate_uri(model, attr, value)
  end

end


# This helper might be useful later too.
#
def validate_uri(model, attr, uri)
  # This check is not necessary, but it can be helpful.
  if uri !~ %r{^$|^https?://}
    model.errors.add(attr, "must be a URL (e.g. http://charity.org/)") 
    return
  end
  begin
    parsed = URI.parse(uri)
    if parsed.path.empty?
      uri += '/'
      parsed = URI.parse(uri)
    end
    http = Net::HTTP.new(parsed.host, parsed.port)
    code = http.request_head(parsed.path).code
    if code != '200'
      # Try a slower method, with redirection.
      code = resolve(uri).code
    end
    model.errors.add(attr, "could not be found at '#{uri}' (error #{code})") if code != '200'
  rescue Exception => e
    logger.error("During Charity validation for '#{attr}' attr,\n\tGET #{uri} -> " + e.to_s)
    model.errors.add(attr, "could not be reached at '#{uri}'")
  end
end


# URL redirection.
#
# Based on code from http://railstips.org/blog/archives/2009/03/04/following-redirects-with-nethttp/

class TooManyRedirects < StandardError; end


def resolve(url, redirect_limit=5)
  raise TooManyRedirects if redirect_limit < 0

  parsed = URI.parse(url)
  logger.info("parsed:'#{parsed}'")
  response = Net::HTTP.get_response(parsed)
  #logger.info("response:'#{response.to_s}'")

  #logger.info "redirect limit: #{redirect_limit}"
  #logger.info "response code: #{response.code}"
  #logger.debug "response body: #{response.body}"

  if response.kind_of?(Net::HTTPRedirection)      
    next_url = redirect_url(response)
    #logger.info "redirect found, headed to #{url}"
    return resolve(next_url, redirect_limit-1)
  end
  
  return response
end


def redirect_url(response)
  if response['location'].nil?
    return response.body.match(/<a href=\"([^>]+)\">/i)[1]
  else
    return response['location']
  end
end

