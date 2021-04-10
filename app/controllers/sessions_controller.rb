class SessionsController < ApplicationController
  def show
    @user = current_user
  end

  def new
    return redirect_to '/profile' if current_user
  end
end
