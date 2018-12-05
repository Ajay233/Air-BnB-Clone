require_relative '../../lib/models/space'
require_relative '../../lib/models/user'

describe Space do
  let(:user_db_params) do
    { name: 'Name1', username: 'Username',
      email: 'email@email.com', password: 'qwe' }
  end
  let(:space_obj_params) do
    { id: '1', name: 'Flat1',
      description: '1-bedroom flat',
      date_available: '2019-01-01', booked: 'f',
      owner_id: '1' }
  end
  let(:space_db_params) do
    { name: 'Flat1',
      description: '1-bedroom flat',
      date_available: '2019-01-01', booked: 'f',
      owner_id: '1' }
  end
  let(:space) { Space.new(space_obj_params) }

  before(:each) do
    User.create(user_db_params)
  end

  it 'is an instance of Space' do
    expect(space).to be_an_instance_of Space
  end

  describe 'initialize' do
    it 'has id, name, description, date_available, booked, owner_id' do
      check_space(space)
    end
  end

  describe 'create' do
    it 'adds a space' do
      space = Space.create(space_db_params)

      check_space(space)
    end
  end
end
