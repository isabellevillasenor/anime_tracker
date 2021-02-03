require 'rails_helper'

describe 'Destroy Session for a User' do
  it 'will destroy the current users session when logging out' do
    user = User.create(email: 'gon@hxh.com', password: 'test')

    visit root_path

    click_link 'I Have an Account'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.email}!")
    expect(page).to have_link('Log Out')

    click_link 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logged Out!')
    expect(page).to have_link('Register as a User')
    expect(page).to have_link('I Have an Account')
  end
end