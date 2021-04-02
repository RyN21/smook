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
end
