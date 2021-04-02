require 'rails_helper'

RSpec.describe 'User Sign Up' do
  it 'user can sign up' do
    visit '/sign_up'

    fill_in :email, with: "test1@test.com"
    fill_in :username, with: "ryan21"
    fill_in :first_name, with: "Ryan"
    fill_in :last_name, with: "Laleh"
    fill_in :password, with: "1234Abc!"
    fill_in :confirm_password, with: "1234Abc!"

    click_button 'Submit'

    expect(current_path).to eq('/profile')
    # flash message
    expect(page).to have_content("ryan21")
    expect(page).to have_content("Ryan Laleh, You are now signed up!")
  end

  it "user sign up fails, Fields empty" do
    visit '/sign_up'

    fill_in :email, with: ""
    fill_in :username, with: ""
    fill_in :first_name, with: "Ryan"
    fill_in :last_name, with: "Laleh"
    fill_in :password, with: "1234Abc!"
    fill_in :confirm_password, with: "1234Abc!"

    click_button 'Submit'

    expect(current_path).to eq('/sign_up')
    expect(page).to have_content("User could not be created: [\"Email can't be blank\", \"Username can't be blank\"]")
  end

  it "user sign up fails, Email already taken" do
    user = User.create!(email: "test@test.com", username: "user1", password: "123456")
    visit '/sign_up'

    fill_in :email, with: "test@test.com"
    fill_in :username, with: "ryan21"
    fill_in :first_name, with: "Ryan"
    fill_in :last_name, with: "Laleh"
    fill_in :password, with: "1234Abc!"
    fill_in :confirm_password, with: "1234Abc!"

    click_button 'Submit'

    expect(current_path).to eq('/sign_up')
    expect(page).to  have_content("User could not be created: [\"Email has already been taken\"]")
  end

  it "user sign up fails, Username already taken" do
    user = User.create!(email: "test@test.com", username: "user1", password: "123456")
    visit '/sign_up'

    fill_in :email, with: "test1@test.com"
    fill_in :username, with: "user1"
    fill_in :first_name, with: "Ryan"
    fill_in :last_name, with: "Laleh"
    fill_in :password, with: "1234Abc!"
    fill_in :confirm_password, with: "1234Abc!"

    click_button 'Submit'

    expect(current_path).to eq('/sign_up')
    expect(page).to  have_content("User could not be created: [\"Username has already been taken\"]")
  end

  it "user sign up fails, Password does not match" do
    visit '/sign_up'

    fill_in :email, with: ""
    fill_in :username, with: ""
    fill_in :first_name, with: "Ryan"
    fill_in :last_name, with: "Laleh"
    fill_in :password, with: "1234Abc!"
    fill_in :confirm_password, with: "1234Abc!"

    click_button 'Submit'

    expect(current_path).to eq('/sign_up')
    expect(page).to have_content("User could not be created: [\"Passwords do not match\"]")
  end
end
