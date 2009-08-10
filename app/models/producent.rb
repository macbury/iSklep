class Producent < ActiveRecord::Base
  has_many :produkty, :dependent => :destroy
  has_permalink :nazwa
  validates_presence_of :nazwa
  liquid_methods :nazwa, :permalink
end
