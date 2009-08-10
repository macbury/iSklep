class ProduktyController < ApplicationController
  before_filter :login_required
  
  tab :produkty
  sub_tab :przegladaj, :except => [:new, :create]
  sub_tab :dodaj_produkt, :only => [:new, :create]
  
  def index
    @produkty = Produkt.all( :include => [:producent, :kategoria] )
  end

  def new
    @produkt = Produkt.new
    @h1 = "Nowy produkt"
    3.times { @produkt.zdjecia.build }
  end

  def edit
    @produkt = Produkt.find(params[:id], :include => :zdjecia)
    @h1 = "Edycja produktu"
    render :action => 'new'
  end

  def create
    @produkt = Produkt.new(params[:produkt])
    @h1 = "Nowy produkt"
    respond_to do |format|
      if @produkt.save
        flash[:notice] = 'Produkt został dodany.'
        format.html { redirect_to produkty_path }
        format.xml  { render :xml => @produkt, :status => :created, :location => @produkt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produkt.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @produkt = Produkt.find(params[:id])
    @h1 = "Edycja produktu"
    
    respond_to do |format|
      if @produkt.update_attributes(params[:produkt])
        flash[:notice] = 'Produkt został zaktualizowany.'
        format.html { redirect_to produkty_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produkt.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def preview
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    @produkt = Produkt.find(params[:id])
    @produkt.destroy

    respond_to do |format|
      format.html { redirect_to(produkty_path) }
      format.xml  { head :ok }
      format.js
    end
  end

end
