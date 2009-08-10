module SklepHelper
  
  HELPERS = [SklepHelper, ActionView::Helpers::TagHelper, ActionView::Helpers::AssetTagHelper]
  
  def snippet(name)
    Liquid::Template.parse(read_snpippet(name)).render({ 'sklep' => SklepDrop.new }, :filters => HELPERS)
  end
  
  def read_snpippet(filename)
    File.read( RAILS_ROOT + "/themes/#{CONFIG['strona']['skorka']}/_#{filename}.liquid" )
  end
  
  def render_template(action, options=nil)
    options['sklep'] = SklepDrop.new
    render :text => Liquid::Template.parse(read_template(action)).render(options, :filters => HELPERS ), :layout => false
  end
  
  def read_template(filename)
    File.read( RAILS_ROOT + "/themes/#{CONFIG['strona']['skorka']}/#{filename}.liquid" )
  end
  
  def url_for_producent(obj)
    "/producent/#{obj.permalink}/"
  end
  
  def url_for_kategoria(obj)
    "/kategoria/#{obj.permalink}/"
  end
  
  def url_for_produkt(obj)
    "/produkt/#{obj.permalink}"
  end
  
  def img_url(obj,size=nil)
    obj.zdjecie.url(size)
  end
  
  def textile(tekst)
    RedCloth.new(tekst).to_html
  end
end