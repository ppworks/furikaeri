require 'rails_helper'

RSpec.describe Project do
  describe 'create project' do
    subject { create(:project) }
    it { expect(subject).to be_persisted }
  end

  describe 'create projects' do
    let(:project_count) { 10 }
    subject { create_list(:project, project_count) }
    it do
      expect {
        subject
      }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
