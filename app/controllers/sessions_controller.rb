class SessionsController < ApplicationController
  def new
  
  end
  def new_password_ready
    #itt lesz a végállomás
  end
  def recovery_user
    #Ide jön a mail ből a user
  end
  def recovery_mail
    user =  User.find(params[:session][:user_id])
    if user.recovery == params[:session][:recovery_id]
      user.password = params[:session][:new_password]
      user.recovery = nil
      user.save
      redirect_to new_password_ready_path
    end
    
  end
  def recovery
    #Első oldal, ahol kéred a jelszó visszaállítást
  end
  def recovery_mail_sent
    #El lett küldve az adat, itt jelzem ki, utolsó oldal
  end
  def sessions_recovery_mail
    #Itt adod meg a mail adatait
  user =  User.find_by(name: params[:session][:name].downcase)  
  if user
    user.recovery = SecureRandom.urlsafe_base64(20)
    user.save
    ApplicationMailer.recovery_email(user.id).deliver
    redirect_to recovery_mail_sent_path(id: user.id)
  else
  
  end

  end
  def create
    user = User.find_by(name: user_params[:name].downcase).try(:authenticate, user_params[:password])
    if user
      session[:user_id] = user.id
      record_activity("Beléptetve: #{user.name} (ID:##{user.id})")
      redirect_to root_url, notice: "Belépve!"
    else
      sleep 10
      record_attempts("Hibás belépés" + user_params[:name].downcase)
      redirect_to login_url, notice: "Hibás név vagy jelszó!"
    end
   end
   
   private
    def user_params
     params.require(:session).permit(:name, :password)
    end
end
