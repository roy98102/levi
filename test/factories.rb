# For some reason, this file is not discovered by factory_girl.
#require 'factory_girl'
#require File.expand_path(File.dirname(__FILE__) + "/factories")
#Factory.find_definitions

Factory.define :user do |u|
  u.email 'a@c.com'
  u.password 'aaaaaa'
  u.password_confirmation {|a| a.password}
end

