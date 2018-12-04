require_relative '../../lib/models/user'

describe User do
  let(:user) { User.new(id: "1", name: "Name1", username: "Username", email: "email@email.com") }

  it "is an instance of User" do
    expect(user).to be_an_instance_of User
  end

  describe "initialize" do
    it "has id, name, username, email" do
      expect(user.id).to eq('1')
      expect(user.name).to eq('Name1')
      expect(user.username).to eq('Username')
      expect(user.email).to eq('email@email.com')
    end
  end
end
