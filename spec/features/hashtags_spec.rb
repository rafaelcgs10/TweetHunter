require 'rails_helper'

RSpec.feature "Hashtags", type: :feature do
  context 'create new hashtag' do
    scenario 'should be successful' do
      visit new_hashtag_path
      within 'form' do
        fill_in 'Hashtag', with: '#udesc'
      end
      click_button 'Save Hashtag'
      expect(page).to have_content('Hashtag: #udesc')
    end
    scenario 'should fail because input is not a hashtag' do
      visit new_hashtag_path
      within 'form' do
        fill_in 'Hashtag', with: 'udesc'
      end
      click_button 'Save Hashtag'
      expect(page).to have_content('Hashtag: #udesc')
    end
  end
end
