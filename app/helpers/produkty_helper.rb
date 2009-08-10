module ProduktyHelper
  def kategoria_for_produkt(produkt)
    unless produkt.kategoria.nil?
      produkt.kategoria.root? ? produkt.kategoria.root.nazwa + ' &#x2192; ' + produkt.kategoria.nazwa : produkt.kategoria.nazwa
    else
      'Brak'
    end
  end
  
  def producent(produkt)
    if produkt.producent.nil?
      'Brak'
    else
      produkt.producent.nazwa
    end
  end
  
  def link_to_remote_delete(produkt)
    link_to_remote 'Usuń', :url => produkt, :method => :delete, :loading => "flobu.enable();", :complete => "$('#produkt_#{produkt.id}').remove(); flobu.disable();", :confirm => 'Czy jesteś pewien że chcesz usunąć ten produkt?'
  end
  
  def add_zdjecie_link(name)
    link_to_function name do |page|
        page.insert_html :bottom, :galeria, :partial => 'zdjecie', :object => Zdjecie.new
    end
  end
  
  def fields_for_zdjecie(zdjecie, &block)
    prefix = zdjecie.new_record? ? 'new' : 'update'
    fields_for("produkt[#{prefix}_zdjecie_attr][]", zdjecie, &block)
  end
  
  def image_preview(zdjecie)
    link_to( image_tag(zdjecie.url(:mini)), zdjecie.url(:large), :rel => 'facebox' )
  end
  
end
