class KategorieController < ApplicationController
  before_filter :login_required
  tab :produkty
  sub_tab :kategorie
  
  def index
    
  end
  
  def new
    @kategoria = Kategoria.new
    @naglowek = 'Nowa kategoria'
  end
  
  def create
    @kategoria = Kategoria.new(params[:kategoria])
    @naglowek = 'Nowa kategoria'
    if @kategoria.save
      flash[:notice] = 'Kategoria została utworzona'
      redirect_to kategorie_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @kategoria = Kategoria.find(params[:id])
    @naglowek = 'Edycja kategoria'
    render :action => "new"
  end
  
  def update
    @kategoria = Kategoria.find(params[:id])
    @naglowek = 'Edycja kategoria'
    if @kategoria.update_attributes(params[:kategoria])
      flash[:notice] = 'Kategoria została zapisana'
      redirect_to kategorie_path
    else
      render :action => "new"
    end
  end
  
  def destroy
    @kategoria = Kategoria.find(params[:id])
    @kategoria.destroy
    redirect_to kategorie_path
  end
end
