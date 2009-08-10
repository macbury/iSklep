# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'uzytkownik', 'uzytkownicy'
   inflect.irregular 'kategoria', 'kategorie'
   inflect.irregular 'produkt', 'produkty'
   inflect.irregular 'wersja', 'wersja'
   inflect.irregular 'producent', 'producenci'
   inflect.irregular 'zdjecie', 'zdjecia'
   inflect.irregular 'pliki', 'pliki'
#   inflect.uncountable %w( fish sheep )
 end
