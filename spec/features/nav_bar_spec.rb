require 'rails_helper'

RSpec.describe 'nav bar' do
  it "has a home button in the nav bar" do
    visit '/'
    expect(page).to have_content('Home')
  end

  it "has a home button that directs to home page" do
    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it "has a log in in nav bar" do
    visit '/'
    click_link 'Log In'
    expect(current_path).to eq('/log_in')
  end
end
