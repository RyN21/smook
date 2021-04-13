require 'rails_helper'
require "./spec/support/devise"

RSpec.describe 'User Sign Up' do
  user = login_user
  it 'user can navigate to sign up from home' do
    visit '/'
    click_link 'Sign in'
    expect(current_path).to eq('/sign_in')
    click_link 'Sign up'
    expect(current_path).to eq('/users/sign_up')
  end

  it 'user can be created and sign up' do
    binding.pry
    visit '/users/sign_up'
    fill_in :Email, with: "laleh21@yahoo.com"
    fill_in :Username, with: "ryn21"
    fill_in :Password, with: "1234Abc!"
    # save_and_open_page
    # fill_in :Password_confirmation, with: "1234Abc!"

    click_button 'Submit'
    expect(current_path).to eq('/profile')
    # flash message
    expect(page).to have_content("ryan21")
    expect(page).to have_content("Ryan Laleh, You are now signed up!")
  end

  # it "user sign up fails, Fields empty" do
  #   visit '/sign_up'
  #
  #   fill_in :email, with: ""
  #   fill_in :username, with: ""
  #   fill_in :first_name, with: "Ryan"
  #   fill_in :last_name, with: "Laleh"
  #   fill_in :password, with: "1234Abc!"
  #   fill_in :password_confirmation, with: "1234Abc!"
  #
  #   click_button 'Submit'
  #
  #   expect(current_path).to eq('/sign_up')
  #   expect(page).to have_content("User could not be created: [\"Email can't be blank\", \"Username can't be blank\"]")
  # end
  #
  # it "user sign up fails, Email already taken" do
  #   user = User.create!(email: "test@test.com", username: "user1", first_name: "Olivia", password: "123456")
  #   visit '/sign_up'
  #
  #   fill_in :email, with: "test@test.com"
  #   fill_in :username, with: "ryan21"
  #   fill_in :first_name, with: "Ryan"
  #   fill_in :last_name, with: "Laleh"
  #   fill_in :password, with: "1234Abc!"
  #   fill_in :password_confirmation, with: "1234Abc!"
  #
  #   click_button 'Submit'
  #
  #   expect(current_path).to eq('/sign_up')
  #   expect(page).to  have_content("User could not be created: [\"Email has already been taken\"]")
  # end
  #
  # it "user sign up fails, Username already taken" do
  #   user = User.create!(email: "test@test.com", username: "user1", first_name: "Olivia", password: "123456")
  #   visit '/sign_up'
  #
  #   fill_in :email, with: "test1@test.com"
  #   fill_in :username, with: "user1"
  #   fill_in :first_name, with: "Ryan"
  #   fill_in :last_name, with: "Laleh"
  #   fill_in :password, with: "1234Abc!"
  #   fill_in :password_confirmation, with: "1234Abc!"
  #
  #   click_button 'Submit'
  #
  #   expect(current_path).to eq('/sign_up')
  #   expect(page).to  have_content("User could not be created: [\"Username has already been taken\"]")
  # end
  #
  # it "user sign up fails, Password does not match" do
  #   visit '/sign_up'
  #
  #   fill_in :email, with: "test@test.com"
  #   fill_in :username, with: "user1"
  #   fill_in :first_name, with: "Ryan"
  #   fill_in :last_name, with: "Laleh"
  #   fill_in :password, with: "1234Abc!"
  #   fill_in :password_confirmation, with: "123Abc!"
  #
  #   click_button 'Submit'
  #
  #   expect(current_path).to eq('/sign_up')
  #   expect(page).to have_content("User could not be created: [\"Password confirmation doesn't match Password\"]")
  # end

  # it "user sign up fails, Password validation" do
  #   visit '/sign_up'
  #
  #   fill_in :email, with: "test@test.com"
  #   fill_in :username, with: "user1"
  #   fill_in :first_name, with: "Ryan"
  #   fill_in :last_name, with: "Laleh"
  #   fill_in :password, with: "1234abc!"
  #   fill_in :password_confirmation, with: "1234abc!"
  #
  #   click_button 'Submit'
  #
  #   expect(current_path).to eq('/sign_up')
  #   expect(page).to have_content("User could not be created: [\"Password must consist of at least 8 characters, and.. \"]")
  # end
end


#
# class UsersController < ApplicationController
#   def new; end
#
#   def create
#     user = User.new(user_params)
#     if user.save
#       session[:user_id] = user.id
#       redirect_to '/profile'
#       flash[:success] = "#{user.name}, You are now signed up!"
#     else
#       flash[:error] = "User could not be created: #{user.errors.full_messages.uniq.each {|msg| msg}}"
#       redirect_to '/sign_up'
#     end
#   end
#
#   private
#   def user_params
#     binding.pry
#     params.permit(:email, :username, :first_name, :last_name, :password, :password_confirmation)
#   end
# end
