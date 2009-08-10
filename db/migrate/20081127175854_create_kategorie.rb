class CreateKategorie < ActiveRecord::Migration
  def self.up
    create_table :kategorie do |t|
      t.string :nazwa
      t.integer :parent_id
      
      t.string :permalink
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :kategorie
  end
end
