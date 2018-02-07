class SessionsController < ApplicationController

  def index
  end
  
  #get /signin
  def new
  end
  
  #post /signin
  def create
    if @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end
  
  def destroy
    if session.include? :user_id
      session.delete :user_id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
