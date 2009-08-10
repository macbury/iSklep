class AddPermalinkToProdukty < ActiveRecord::Migration
  def self.up
    add_column :produkty, :permalink, :string
  end

  def self.down
    add_remove :produkty, :permalink
  end
end
