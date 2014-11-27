require 'rails_helper'

describe 'create new issue' do
  let(:project) { create(:project) }
  let(:new_issue) { build(:issue) }
  feature 'create new issue' do
    scenario do
      visit project_path(project)
      within('#new_issue') do
        find('#issue_title').set(new_issue.title)
        select(new_issue.status_text, from: 'issue_status')
        find('input[type=submit]').click
      end
      expect(page).to have_content('created new issue')
      within("ul.#{new_issue.status}") do
        expect(page).to have_content(new_issue.title)
      end
      expect(current_path).to eq project_path(project)
    end
  end
end
