require 'rails_helper'

RSpec.describe 'Home page' do
  it "has a home page" do
    visit '/'
    expect(current_path).to eq('/')
  end
end
