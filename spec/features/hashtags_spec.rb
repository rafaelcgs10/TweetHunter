require 'rails_helper'

RSpec.feature "Hashtags", type: :feature do
  context 'create new hashtag' do
    scenario 'should create' do
      visit new_hashtag_path
      within 'form' do
        fill_in 'Hashtag', with: '#udesc'
      end
      click_button 'Save Hashtag'
      expect(page).to have_content('Hashtag: #udesc')
    end

    scenario 'should fail to create' do
      visit new_hashtag_path
      within 'form' do
        fill_in 'Hashtag', with: 'udesc'
      end
      click_button 'Save Hashtag'
      expect(page).to have_content('field is not a valid query')
    end
  end

  context 'checking database loaded' do
    fixtures :hashtags

    scenario 'should not have hashtag #bear' do
      visit root_path
      expect(page).not_to have_content('#bear')
    end

    scenario 'should have hashtag #cat' do
      visit root_path
      expect(page).to have_content('#cat')
    end

    scenario 'should have hashtag #dog' do
      visit root_path
      expect(page).to have_content('#cat')
    end
  end

  context 'delete hashtag' do
    fixtures :hashtags

    scenario 'should delete' do
      visit root_path
      expect(page).to have_content('#cat')
      within("//td[@id='delete_#cat']") do
        click_link 'Delete'
      end
      expect(page).not_to have_content('#cat')
    end
  end
end
