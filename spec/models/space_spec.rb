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

  describe 'all' do
    it 'displays all the spaces' do
      space = Space.create(space_db_params)
      space2_db_params = {
        name: 'house1',
        description: '2-bedroom house',
        date_available: '2018-12-20', booked: 'f',
        owner_id: '1'
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
    end
  end

  describe 'users_spaces' do
    it 'can list a particular users spaces' do
     new_user =  User.create({ name: 'Name2', username: 'blank user',
                               email: 'blank_email@email.com', password: 'qwe2' })

    5.times do |i|
      Space.create( { name: "Flat#{i}",
                      description: "#{i}-bedroom flat",
                      date_available: "2019-01-01", booked: 'f',
                      owner_id: '1' } )
      Space.create( { name: "Flat#{i + 7}",
                      description: "#{i}-bedroom flat",
                      date_available: "2019-01-01", booked: 'f',
                      owner_id: '2' } )
    end

    spaces = Space.users_spaces(user: new_user.id)

    spaces.each { |space| expect(space.owner_id).to eq('1') }
    expect(spaces.size).to eq(5)
    end
  end
end
