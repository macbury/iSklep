class Zdjecie < ActiveRecord::Base
  belongs_to :produkty
  has_attached_file :zdjecie, :styles => { :large => "356x356>", :medium => "100x100>", :mini => '33x33>' }
  validates_attachment_presence :zdjecie
  
  liquid_methods :zdjecie, :url
  
  def url(size)
    zdjecie.url(size)
  end

end