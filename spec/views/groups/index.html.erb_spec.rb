require 'rails_helper'

RSpec.describe 'Group', type: :system do
  describe 'group index page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @group = Group.create(author: @user, name: "test group1", icon: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg")
      Group.create(author: @user, name: "test group2", icon: "https://cdn.britannica.com/25/7125-050-67ACEC3C/Abyssinian-sorrel.jpg")
      visit groups_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end
    it 'Group list' do
      expect(page).to have_content('test group1')
      expect(page).to have_content('test group2')
    end
    it 'Group Icon' do
      expect(page).to have_css('img[src="https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"]')
      expect(page).to have_css('img[src="https://cdn.britannica.com/25/7125-050-67ACEC3C/Abyssinian-sorrel.jpg"]')
    end
    it 'When I click on a group, I am redirected to that group show page.' do
      click_link 'test group1'
      expect(page).to have_current_path(group_path(@group))
    end
  end
end