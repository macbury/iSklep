class AddAttachmentsZdjecieToProdukt < ActiveRecord::Migration
  def self.up
    add_column :produkty, :zdjecie_file_name, :string
    add_column :produkty, :zdjecie_content_type, :string
    add_column :produkty, :zdjecie_file_size, :integer
    add_column :produkty, :zdjecie_updated_at, :datetime
  end

  def self.down
    remove_column :produkty, :zdjecie_file_name
    remove_column :produkty, :zdjecie_content_type
    remove_column :produkty, :zdjecie_file_size
    remove_column :produkty, :zdjecie_updated_at
  end
end
