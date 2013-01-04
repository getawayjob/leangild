
require 'spec_helper'

describe Update do
	it { should have_db_column(:startup_id) }
	it { should have_db_column(:content) }

	it { should belong_to(:startup) }

	let(:user) { FactoryGirl.create(:user) }
	let(:startup) { FactoryGirl.create(:startup, user: user) }

	before do
		@update = startup.updates.build(content: "update", startup_id: startup.id)
	end

	subject { @update }

	it { should be_valid }

	it { should validate_presence_of(:content) }
	it { should validate_presence_of(:startup_id) }

	it { should ensure_length_of(:content).is_at_most(250) }
end