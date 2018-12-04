require_relative '../../lib/models/user'

describe User do
  let(:user_db_params) { {name: "Name1", username: "Username", email: "email@email.com", password: "password"} }
  let(:user_obj_params) { {id: "1", name: "Name1", username: "Username", email: "email@email.com"} }
  let(:user) { User.new(user_obj_params) }

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

  describe "#create" do
    it("can create a new user in the users table") do
      new_user = User.create(user_db_params)
      expect(new_user.id).to eq('1')
      expect(new_user.name).to eq('Name1')
      expect(new_user.username).to eq('Username')
      expect(new_user.email).to eq('email@email.com')
    end
  end
end
