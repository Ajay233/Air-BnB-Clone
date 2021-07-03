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
      owner_id: '1', price: '100' }
  end
  let(:space_db_params) do
    { name: 'Flat1',
      description: '1-bedroom flat',
      date_available: '2019-01-01', booked: 'f',
      owner_id: '1', price: '100' }
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

  describe 'all' do
    it 'displays all the spaces' do
      space = Space.create(space_db_params)
      space2_db_params = {
        name: 'house1',
        description: '2-bedroom house',
        date_available: '2018-12-20', booked: 'f',
        owner_id: '1',
        price: '120',
      }
      Space.create(space2_db_params)
      spaces = Space.all

      expect(spaces.length).to eq 2
      expect(spaces.first).to be_an_instance_of Space
      expect(spaces.first.id).to eq space.id
      expect(spaces.first.name).to eq space.name
      expect(spaces.first.description).to eq space.description
      expect(spaces.first.date_available).to eq space.date_available
      expect(spaces.first.booked).to eq space.booked
      expect(spaces.first.owner_id).to eq space.owner_id
      expect(spaces.first.price).to eq space.price
<<<<<<< HEAD
    end
  end

  describe '.available' do
    it 'can list spaces which are available between two dates' do
      10.times do |num|
        space_db_params_multidate = {
          name: "house#{num}",
          description: '2-bedroom house',
          date_available: "2018-#{num + 1}-20", booked: 'f',
          owner_id: '1'
        }
        Space.create(space_db_params_multidate)
      end

      spaces = Space.available(date_from: '2018-02-01', date_to: '2018-07-25')

      expect(spaces.length).to eq 6
      expect(spaces.first).to be_an_instance_of Space
      expect(spaces.last).to be_an_instance_of Space
      expect(spaces.first.date_available).to eq('2018-02-20')
      expect(spaces.last.date_available).to eq('2018-07-20')
=======
>>>>>>> 3f3c48f6a0b61c867b4b06b53d0911d3363a9f4b
    end
  end
end
