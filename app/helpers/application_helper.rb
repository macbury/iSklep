# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin_button(tekst, path)
    link_to tekst, path, :class => 'button'
  end
  
  def admin_delete_button(obj)
    link_to('Usuń', obj, :confirm => 'Czy jesteś pewien?', :method => :delete) unless obj.new_record?
  end
  
  def options_for_kategorie
    Kategoria.all.map do |k|
      nazwa = k.root? ? " - #{k.nazwa}" : "#{k.nazwa}"
      [nazwa, k.id] 
    end
  end
end
