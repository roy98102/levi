class AddLogoToCharity < ActiveRecord::Migration
  def self.up
    add_column :charities, :logo, :string
  end

  def self.down
    remove_column :charities, :logo
  end
end
