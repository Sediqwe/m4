class ApplicationController < ActionController::Base
    helper_method :current_user  
    add_flash_types :info, :error, :warning
    before_action :set_search
    
    def set_search        
        @q = Game.ransack(params[:q])         
    end
def current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id])
  else
    @current_user = nil
  end
end
  private
def authorized?
  return if current_user.present?
  flash[:error] = 'Előbb lépj be!.'
  redirect_to login_signin_url
end
def admin?
  return if current_user.admin?
    flash[:error] = 'Csak adminoknak!.'
    redirect_to root_url
end

def autotab
  @current_tab ||= 0
  @current_tab += 1
end
end
