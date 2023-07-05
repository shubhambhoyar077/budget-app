require 'rails_helper'

RSpec.describe 'Group/show', type: :system do
  describe 'group show page' do
    before do
      @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
      @group = Group.create(author: @user, name: "test group1", icon: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg")
      @product = Product.new(author: @user, name: "test product", amount: 20, groups: [@group])
      # @product << @group
      @product.save
      visit group_path(@group)
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end
    it 'Group name' do
      expect(page).to have_content('test group1')
    end
    it 'Group Icon' do
      expect(page).to have_css('img[src="https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"]')
    end
    it 'Group total' do
      expect(page).to have_content('$20.0')
    end
    it 'When I click on a add category, I am redirected to that category form page.' do
      click_button 'Add Transaction'
      expect(page).to have_current_path(new_group_product_path(@group))
    end
  end
end