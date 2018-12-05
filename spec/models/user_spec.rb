require_relative '../../lib/models/user'

describe User do
  let(:user_db_params) do
    { name: 'Name1', username: 'Username',
      email: 'email@email.com', password: 'password' }
  end

  let(:user_obj_params) do
    { id: '1', name: 'Name1', username: 'Username', email: 'email@email.com' }
  end

  let(:user) { User.new(user_obj_params) }

  it 'is an instance of User' do
    expect(user).to be_an_instance_of User
  end

  describe 'initialize' do
    it 'has id, name, username, email' do
      check_user(user)
    end
  end

  describe '#create' do
    it 'can create a new user in the users table' do
      new_user = User.create(user_db_params)
      check_user(new_user)
    end
  end

  describe '#find' do
    it 'can retrieve a user from the users table' do
      User.create(user_db_params)
      found_user = User.find(id: '1')
      check_user(found_user)
    end
  end

  describe '#authenticate' do
    it 'will return a valid user when the email and password is valid' do
      User.create(user_db_params)
      authenticated_user = User.authenticate(
        email: user_db_params[:email],
        password: user_db_params[:password]
      )
      check_user(authenticated_user)
    end

    it 'will return nil when the email is invalid' do
      User.create(user_db_params)
      invalid = User.authenticate(email: 'wrong@email.com',
                                  password: user_db_params[:password])
      expect(invalid).to be(nil)
    end

    it 'will return nil when the password is invalid' do
      User.create(user_db_params)
      invalid = User.authenticate(email: user_db_params[:email],
                                  password: 'wrong_password')
      expect(invalid).to be(nil)
    end
  end
end
