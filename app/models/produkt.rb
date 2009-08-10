class Produkt < ActiveRecord::Base
  belongs_to :kategoria
  belongs_to :producent
  validates_presence_of :nazwa, :opis
  has_permalink :nazwa
  has_many :zdjecia, :dependent => :destroy
  has_attached_file :zdjecie, :styles => { :large => "356x356>", :medium => "169x169>", :mini => '33x33>' }
  
  liquid_methods :nazwa, :permalink, :kategoria, :opis, :zdjecia, :zdjecie, :producent
  
  after_update :save_zdjecia
  
  def save_zdjecia
    zdjecia.each { |zdjecie| zdjecie.save(false) }
  end
  
  def new_zdjecie_attr=(zdjecia_attr)
    zdjecia_attr.each do |zdjecie_attr|
      zdjecia.build(zdjecie_attr)
    end
  end
  
  def update_zdjecie_attr=(zdjecie_attr)
    zdjecia.reject(&:new_record?).each do |zdjecie|
      attributes = zdjecie_attr[zdjecie.id.to_s]
      if attributes
        zdjecie.attributes = attributes
      else
        zdjecia.delete(zdjecie)
      end
    end
  end
end
