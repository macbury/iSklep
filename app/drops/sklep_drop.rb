class SklepDrop < Liquid::Drop
  def kategorie
    Kategoria.find_roots(true)
  end
  
  def producenci
    Producent.all
  end
  
  def najczesciej_kupowane
    Produkt.all(:limit => 3, :order => 'created_at')
  end
  
  def nazwa
    CONFIG['strona']['nazwa']
  end
  
  def slogan
    CONFIG['strona']['slogan']
  end
  
  def head
    out = '<meta name="description" content="'+CONFIG['strona']['opis']+'" />'+ "\n"
    out += '<meta name="keywords" content="'+CONFIG['strona']['slowa_kluczowe']+'" />'
  end
end