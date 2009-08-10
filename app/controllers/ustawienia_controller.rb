class UstawieniaController < ApplicationController
  before_filter :login_required
  tab :ustawienia
  sub_tab :ustawienia
  
  def index
    return unless request.post?
    CONFIG['strona'] = params['strona']
    CONFIG['informacje'] = params['informacje']
    File.open( RAILS_ROOT + '/config/site.yml', 'w' ) do |out|
        YAML.dump( CONFIG, out )
    end
  end
end
