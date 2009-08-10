class CreateZdjecia < ActiveRecord::Migration
  def self.up
    create_table :zdjecia do |t|
      t.string :zdjecie_file_name
      t.string :zdjecie_content_type
      t.integer :zdjecie_file_size
      t.datetime :zdjecie_updated_at
      
      t.integer :produkt_id
    end
  end

  def self.down
    drop_table :zdjecia
  end
end
