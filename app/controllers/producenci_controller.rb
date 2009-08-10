class ProducenciController < ApplicationController
  before_filter :login_required
  tab :produkty
  sub_tab :producenci

  def index
    @producenci = Producent.all
  end

  def new
    @naglowek = 'Nowy producent'
    @producent = Producent.new
  end

  def edit
    @naglowek = 'Edycja producenta'
    @producent = Producent.find(params[:id])
    render :action => "new" 
  end

  # POST /producenci
  # POST /producenci.xml
  def create
    @naglowek = 'Nowy producent'
    @producent = Producent.new(params[:producent])

    if @producent.save
      flash[:notice] = 'Producent został utworzony.'
      redirect_to producenci_path
    else
      render :action => "new"
    end

  end

  def update
    @naglowek = 'Edycja producenta'
    @producent = Producent.find(params[:id])

    if @producent.update_attributes(params[:producent])
      flash[:notice] = 'Producent został zapisany.'
      redirect_to producenci_path
    else
      render :action => "new"
    end

  end

  # DELETE /producenci/1
  # DELETE /producenci/1.xml
  def destroy
    @producent = Producent.find(params[:id])
    @producent.destroy
    
    redirect_to producenci_path
  end
end
