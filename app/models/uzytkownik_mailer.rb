class UzytkownikMailer < ActionMailer::Base
  def signup_notification(uzytkownik)
    setup_email(uzytkownik)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "http://YOURSITE/activate/#{uzytkownik.activation_code}"
  
  end
  
  def activation(uzytkownik)
    setup_email(uzytkownik)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://YOURSITE/"
  end
  
  protected
    def setup_email(uzytkownik)
      @recipients  = "#{uzytkownik.email}"
      @from        = "ADMINEMAIL"
      @subject     = "[YOURSITE] "
      @sent_on     = Time.now
      @body[:uzytkownik] = uzytkownik
    end
end
