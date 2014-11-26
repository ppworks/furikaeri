require 'rails_helper'

RSpec.describe Project do
  describe 'create project' do
    subject { create(:project) }
    it { expect(subject).to be_persisted }
  end
end
