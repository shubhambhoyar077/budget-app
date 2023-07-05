require 'rails_helper'

RSpec.describe 'Product/create', type: :system do
  describe 'prosuct create page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @group = Group.create(author: @user, name: "test group1", icon: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg")

      visit new_group_product_path(@group)
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      fill_in 'Name', with: "test product"
      fill_in 'Amount', with: 20
      select @group.name, from: 'product_group_ids'
      click_button 'Create'
    end
    it 'product name' do
      expect(page).to have_content('test product')
    end
    it 'product amount' do
      expect(page).to have_content('$20.0')
    end
  end
end