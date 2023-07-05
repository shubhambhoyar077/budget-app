require 'rails_helper'

RSpec.describe 'Spalsh/Index.', type: :system do
  describe 'splash index page' do
    before do
      visit root_path
    end
    it 'splash screen name' do
      expect(page).to have_content('SavEarly')
    end
    it 'When I click on a login, I am redirected to that login page.' do
      click_link 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end
    it 'When I click on a sign up, I am redirected to that sign up page.' do
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end