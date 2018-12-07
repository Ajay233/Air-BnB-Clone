# Spaces class
class Space
  def self.create(name:, description:, date_available:,
                  booked:, owner_id:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, date_available, \
      booked, owner_id)
       VALUES('#{name}', '#{description}', '#{date_available}', '#{booked}',
         '#{owner_id}')
       RETURNING id, name, description, date_available, booked, owner_id;"
    ).first
    build_space(result)
  end

  def self.build_space(result)
    Space.new(
      id: result['id'],
      name: result['name'],
      description: result['description'],
      date_available: result['date_available'],
      booked: result['booked'],
      owner_id: result['owner_id']
    )
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;')

    result.map do |space|
      build_space(space)
    end
  end

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM spaces WHERE \
      id = '#{id}';").first
    self.build_space(result)
  end

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
