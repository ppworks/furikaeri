require 'rails_helper'

RSpec.describe Issue do
  let(:project) { create(:project) }
  describe 'create issue' do
    subject { create(:issue, project: project) }
    it { expect(subject).to be_persisted }
  end
end
