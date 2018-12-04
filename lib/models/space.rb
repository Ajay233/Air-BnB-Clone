class Space
  attr_accessor :id, :name, :description, :date_available, :booked, :owner_id

  def initialize(id:, name:, description:, date_available:, booked:, owner_id:)
    @id = id
    @name = name
    @description = description
    @date_available = date_available
    @booked = booked
    @owner_id = owner_id
  end
end
