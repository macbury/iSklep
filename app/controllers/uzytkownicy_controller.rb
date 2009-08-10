class UzytkownicyController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  def index
    redirect_to signup_path
  end
  
  
  # render new.rhtml
  def new
    @uzytkownik = Uzytkownik.new
  end
 
  def create
    logout_keeping_session!
    @uzytkownik = Uzytkownik.new(params[:uzytkownik])
    success = @uzytkownik && @uzytkownik.save
    if success && @uzytkownik.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "Dziękujemy za rejestracje! Link aktywacyjny został wysłany na podany adres e-mail"
    else
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    uzytkownik = Uzytkownik.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && uzytkownik && !uzytkownik.active?
      uzytkownik.activate!
      flash[:notice] = "Rejestracja zakończona! Możesz teraz zalogować się w serwisie"
      redirect_to login_path
    when params[:activation_code].blank?
      flash[:error] = "Brak kodu aktywacyjnego!"
      redirect_back_or_default('/')
    else 
      flash[:error]  = "Nie można aktywować konta..."
      redirect_back_or_default('/')
    end
  end
end
