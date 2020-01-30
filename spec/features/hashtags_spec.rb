# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Hashtags', type: :feature do
  context 'create new hashtag' do
    scenario 'should create' do
      visit root_path
      click_link 'New hashtag'
      within 'form' do
        fill_in 'Hashtag', with: '#udesc'
      end
      click_button 'Save Hashtag'
      expect(page).to have_content('Hashtag: #udesc')
    end

    scenario 'should fail to create' do
      visit root_path
      click_link 'New hashtag'
      within 'form' do
        fill_in 'Hashtag', with: 'udesc'
      end
      click_button 'Save Hashtag'
      expect(page).to have_content('field is not a valid query')
    end
  end

  context 'checking database hashtags loaded' do
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

  context 'checking database tweets loaded' do
    fixtures :hashtags, :tweets

    scenario 'should not have this tweet about #cat' do
      visit root_path
      within("//td[@id='show_#cat']") do
        click_link 'Show'
      end
      expect(page).to_not have_content("I think your cat likes me #cat")
    end

    scenario 'should have tweet about #cat' do
      visit root_path
      within("//td[@id='show_#cat']") do
        click_link 'Show'
      end
      within("//tr[@id='tweet_id_3']") do
        expect(page).to have_content("I think your cat doesn't like me #cat")
      end
    end

    scenario 'should have two tweets about #dog' do
      visit root_path
      within("//td[@id='show_#dog']") do
        click_link 'Show'
      end
      within("//tr[@id='tweet_id_1']") do
        expect(page).to have_content('I like my #dog')
      end
      within("//tr[@id='tweet_id_2']") do
        expect(page).to have_content('I like your #dog')
      end
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
      expect(page).to_not have_content('#cat')
    end
  end
end
