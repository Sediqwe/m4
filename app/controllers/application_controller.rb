class ApplicationController < ActionController::Base
    helper_method :current_user  
    add_flash_types :info, :error, :warning
        before_action :set_search
    
def set_search
    require 'nokogiri'
    require 'open-uri'
    @q = Game.ransack(params[:q]) 
    @download = Download.order("created_at DESC").first(10)
    @uploading = Upload.order("created_at DESC").first(10)
    @rss = Gemorss.order(idouj3: :DESC).first(10)
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
  redirect_to login_path
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
def record_attempts(note)
  @activity = ActivityLog.new
  @activity.note = note
  @activity.browser = request.env['HTTP_USER_AGENT']
  @activity.ip_address = request.env['REMOTE_ADDR']
  @activity.controller = controller_name 
  @activity.action = action_name 
  @activity.save
end
def record_activity(note)
  @activity = ActivityLog.new
  @activity.user_id = current_user.id
  @activity.note = note
  @activity.browser = request.env['HTTP_USER_AGENT']
  @activity.ip_address = request.env['REMOTE_ADDR']
  @activity.controller = controller_name 
  @activity.action = action_name     
  @activity.save
end
end
