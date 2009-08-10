class CreateProdukty < ActiveRecord::Migration
  def self.up
    create_table :produkty do |t|
      t.string :nazwa
      t.text :opis
      t.integer :kategoria_id
      t.integer :producent_id
      t.timestamps
    end
    
    add_column :kategorie, :produkty_count, :integer
  end

  def self.down
    remove_column :kategorie, :produkty_count
    drop_table :produkty
  end
end
