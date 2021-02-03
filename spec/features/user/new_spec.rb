require 'rails_helper'

describe 'User Registration Form' do
  describe 'happy path' do
    it 'creates a new user' do
      visit root_path

      click_link 'Register as a User'

      expect(current_path).to eq(new_user_path)

      email = 'gon@hxh.com'
      password = 'test'

      fill_in :user_email, with: email
      fill_in :user_password, with: password

      click_button 'Create User'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{email}!")
    end
  end
end