require 'rails_helper'

shared_examples_for 'create new issue' do
  feature 'create new issue' do
    scenario do
      visit project_path(project)
      within('#new_issue') do
        find('#issue_title').set(new_issue.title)
        select(new_issue.status_text, from: 'issue_status')
        find('input[type=submit]').click
      end

      expect(page).to have_content('created new issue')
      within("ul.#{status}") do
        expect(page).to have_content(new_issue.title)
      end
      expect(current_path).to eq project_path(project)
    end
  end
end

describe 'Issues' do
  let(:project) { create(:project) }
  let(:new_issue) { build(:issue, status) }

  context 'keep' do
    let(:status) { :keep }
    it_behaves_like 'create new issue'
  end

  context 'problem' do
    let(:status) { :problem }
    it_behaves_like 'create new issue'
  end

  context 'try' do
    let(:status) { :try }
    it_behaves_like 'create new issue'
  end
end
