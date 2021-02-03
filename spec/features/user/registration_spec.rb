require 'rails_helper'

describe 'User Log In' do
  describe 'happy path' do
    it 'allows user to log in' do
      user = User.create(email: 'gon@hxh.com', password: 'test')

      visit root_path

      click_link 'I Have an Account'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_button 'Log In'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.email}!")
    end
  end

  describe 'sad path' do
    it 'blocks login if bad credentials' do
      user = User.create(email: 'gon@hxh.com', password: 'test')

      visit root_path

      click_link 'I Have an Account'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: 'bad pw'

      click_button 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Your credentials are stinky, and that stinks.')
    end
  end
end