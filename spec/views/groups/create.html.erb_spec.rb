require 'rails_helper'

RSpec.describe 'Group/create', type: :system do
  describe 'group create page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      # @product = Product.new(author: @user, name: "test product", amount: 20, groups: [@group])
      # @product.save
      visit new_group_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      fill_in 'Name', with: "test group"
      fill_in 'Icon', with: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"
      click_button 'Create'
    end
    it 'Group name' do
      expect(page).to have_content('test group')
    end
    it 'Group Icon' do
      expect(page).to have_css('img[src="https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"]')
    end
  end
end