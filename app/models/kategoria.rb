class Kategoria < ActiveRecord::Base
  has_many :kategorie, :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :kategoria
  validates_presence_of :nazwa
  has_many :produkty, :dependent => :destroy
  liquid_methods :nazwa, :subKategorie, :root?, :root, :permalink
  
  before_save :generuj_permalink
  
  def generuj_permalink
    nazwa_permalink = PermalinkFu.escape(self.nazwa)
    self.permalink = root? ? "#{root.permalink}/#{nazwa_permalink}" : nazwa_permalink 
  end
  
  def subKategorie
    kategorie
  end
  
  def self.find_roots(include_kategorie=false)
    options = Hash.new
    options[:conditions] ='parent_id IS NULL'
    options[:include] = :kategorie if include_kategorie
    Kategoria.all( options )
  end
  
  def find_childs
    kategorie.all
  end
  
  def self.find_childs_for(s)
    Kategoria.all( :conditions => ['parent_id = ?', s.to_i] )
  end
  
  def self.count_childs
    Kategoria.count( :conditions => 'parent_id IS NOT NULL' )
  end
  
  def self.find_all_childs
    Kategoria.all( :conditions => 'parent_id IS NOT NULL' )
  end
  
  def root
    Kategoria.first( :conditions => ['id = ?', self.parent_id] )
  end
  
  def root?
    !parent_id.nil?
  end
end
