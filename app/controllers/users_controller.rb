class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/profile'
      flash[:success] = "#{user.name}, You are now signed up!"
    else
      flash[:error] = "User could not be created: #{user.errors.full_messages.uniq.each {|msg| msg}}"
      redirect_to '/sign_up'
    end
  end

  private
  def user_params
    params.permit(:email, :username, :first_name, :last_name, :password, :password_confirmation)
  end
end
