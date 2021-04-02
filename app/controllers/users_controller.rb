class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    redirect_to '/profile'
  end

  private
  def user_params
    params.permit(:email, :username, :first_name, :last_name, :password)
  end
end
