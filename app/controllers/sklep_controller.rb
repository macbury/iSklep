class SklepController < ApplicationController
  include SklepHelper
  
  before_filter :get_kategoria, :only => :index
  before_filter :get_producent, :only => :index
  
  def index
    
    if @kategoria
      @produkty = Produkt.all( :conditions => ['kategoria_id = ? OR kategoria_id = ?', @kategoria.id, @kategoria.parent_id] ) 
    elsif @producent
      @produkty = @producent.produkty.all
    else
      @produkty = Produkt.all
    end

    render_template('produkty', 'produkty' => @produkty, 'kategoria' => @kategoria, 'producent' => @producent)
  end
  
  def show
    begin
      @produkt = Produkt.find_by_permalink(params[:permalink], :include => [:zdjecia, :producent, :kategoria])
    rescue ActiveRecord::RecordNotFound
      logger.error "Nie można znaleźć produktu: #{params[:permalink]}"
      redirect_to root_path
    end
    render_template('produkt', 'produkt' => @produkt)
  end
  
  protected
    def get_kategoria
      permalink = params[:sub_kategoria] || params[:kategoria]
      begin
        @kategoria = Kategoria.find_by_permalink(permalink)
      rescue ActiveRecord::RecordNotFound
        logger.error "Nie znaleziono kategorii z permalink: '#{permalink}'"
      end
    end
    
    def get_producent
      permalink = params[:producent]
      begin
        @producent = Producent.find_by_permalink(permalink)
      rescue ActiveRecord::RecordNotFound
        logger.error "Nie znaleziono producenta z permalink: '#{permalink}'"
      end
    end
end