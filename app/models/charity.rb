class Charity < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true,
    :length => {:maximum => 99}
  validates :description,
    :length => {:maximum => 999}
end
