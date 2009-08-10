class CreateProducenci < ActiveRecord::Migration
  def self.up
    create_table :producenci do |t|
      t.string :nazwa
      t.string :permalink
      t.integer :produkty_count

      t.timestamps
    end
  end

  def self.down
    drop_table :producenci
  end
end
