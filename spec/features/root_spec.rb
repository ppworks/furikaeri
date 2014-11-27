require 'rails_helper'

describe 'Root' do
  feature 'visit / path' do
    scenario do
      visit root_path
      expect(page).to have_content 'ふりかえり'
    end
  end
end
