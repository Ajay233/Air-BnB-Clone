require_relative '../../lib/models/user'

describe User do
  let(:user) { User.new }

  it "is an instance of User" do
    expect(user).to be_an_instance_of User
  end
end
