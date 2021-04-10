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
end
