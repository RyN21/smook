require 'rails_helper'

RSpec.describe 'Home page' do
  it "has a home page" do
    visit '/'
    expect(current_path).to eq('/')
  end

  it "has a home button in the nav bar" do
    visit '/'
    expect(page).to have_content('Home')
  end

  it "has a home button that directs to home page" do
    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it "has a log in button if no user is logged in" do
    visit '/'
    click_link 'Log In'
    expect(current_path).to eq('/log_in')
  end
end
