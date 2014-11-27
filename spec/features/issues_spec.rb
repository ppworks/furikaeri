require 'rails_helper'

shared_examples_for 'create new issue' do
  let(:new_issue) { build(:issue, status, project: project) }

  feature do
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

shared_examples_for 'delete an issue' do
  let!(:issue) { create(:issue, project: project) }

  feature do
    scenario 'delete an issue' do
      visit project_path(project)
      within(".issue:last-child") do
        find('.delete-link').click
      end
      expect(page).to have_content('deleted an issue')
    end
  end
end

describe 'Issues' do
  let(:project) { create(:project) }

  context 'keep' do
    let(:status) { :keep }
    it_behaves_like 'create new issue'
    it_behaves_like 'delete an issue'
  end

  context 'problem' do
    let(:status) { :problem }
    it_behaves_like 'create new issue'
    it_behaves_like 'delete an issue'
  end

  context 'try' do
    let(:status) { :try }
    it_behaves_like 'create new issue'
    it_behaves_like 'delete an issue'
  end
end
