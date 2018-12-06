require_relative '../../lib/models/request'
require_relative '../../lib/models/space'
require_relative '../../lib/models/user'

describe Request do
  let(:owner_db_params) do
    { name: 'Name1', username: 'Username',
      email: 'email@email.com', password: 'qwe' }
  end
  let(:requester_db_params) do
    { name: 'Name2', username: 'Username2',
      email: 'email2@email.com', password: 'asd' }
  end
  let(:space_db_params) do
    { name: 'Flat1',
      description: '1-bedroom flat',
      date_available: '2019-01-01', booked: 'f',
      owner_id: '1' }
  end
  let(:request_obj_params) do
    { id: 1, space_id: 1, approval_status: 'Pending', requester_id: 2
    }
  end
  let(:request_db_params) do
    { space_id: 1, requester_id: 2 }
  end
  before(:each) do
    owner = User.create(owner_db_params)
    requester = User.create(requester_db_params)
    space = Space.create(space_db_params)
  end

  it 'is an instance of request' do
    request = Request.new(request_obj_params)
    expect(request).to be_an_instance_of Request
  end

  describe 'initialize' do
    it 'has id, space_id, approval_status, requester_id' do
      request = Request.new(request_obj_params)
      check_request(request)
    end
  end

  describe 'create' do
    it 'creates a request in the requests table in the database' do
      request = Request.create(request_db_params)
      check_request(request)
    end
  end
end
