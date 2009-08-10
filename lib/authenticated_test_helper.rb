module AuthenticatedTestHelper
  # Sets the current uzytkownik in the session from the uzytkownik fixtures.
  def login_as(uzytkownik)
    @request.session[:uzytkownik_id] = uzytkownik ? uzytkownicy(uzytkownik).id : nil
  end

  def authorize_as(uzytkownik)
    @request.env["HTTP_AUTHORIZATION"] = uzytkownik ? ActionController::HttpAuthentication::Basic.encode_credentials(uzytkownicy(uzytkownik).login, 'monkey') : nil
  end
  
end
