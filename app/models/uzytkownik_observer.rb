class UzytkownikObserver < ActiveRecord::Observer
  def after_create(uzytkownik)
    UzytkownikMailer.deliver_signup_notification(uzytkownik)
  end

  def after_save(uzytkownik)
  
    UzytkownikMailer.deliver_activation(uzytkownik) if uzytkownik.recently_activated?
  
  end
end
