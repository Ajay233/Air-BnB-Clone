require_relative '../../lib/models/space'

describe Space do

  let(:user_obj_params) { {id: "1", name: "Name1", username: "Username", \
                        email: "email@email.com"} }
  let(:user) { User.new(user_obj_params) }
  let(:space_obj_params) { {id: "1", name: "Flat1",\
                          description: "1-bedroom flat", \
                          date_available: "2019/01/01", booked: "false", \
                          owner_id: "1"} }
  let(:space) { Space.new(space_obj_params) }

  it "is an instance of Space" do
    expect(space).to be_an_instance_of Space
  end

  describe "initialize" do
    it "has id, name, description, date_available, booked, owner_id" do
      expect(space.id).to eq('1')
      expect(space.name).to eq('Flat1')
      expect(space.description).to eq('1-bedroom flat')
      expect(space.date_available).to eq("2019/01/01")
      expect(space.booked).to eq("false")
      expect(space.owner_id).to eq("1")
    end
  end
end
