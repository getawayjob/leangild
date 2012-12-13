require 'spec_helper'

describe User do
  it { should have_db_column(:first_name) }
  it { should have_db_column(:lastname) }
  it { should have_db_column(:username) }
end
