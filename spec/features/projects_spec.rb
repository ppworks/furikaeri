require 'rails_helper'

describe 'Projects' do
  let(:new_project) { build(:project) }
  feature 'create new project' do
    let(:created_project) { Project.last }
    scenario do
      visit new_project_path
      within('#new_project') do
        find('#project_name').set(new_project.name)
        find('input[type=submit]').click
      end
      expect(page).to have_content('created new project')
      expect(page).to have_content(new_project.name)
      expect(current_path).to eq project_path(created_project)
    end
  end
end
