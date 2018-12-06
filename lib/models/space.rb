# Spaces class
class Space
  def self.create(name:, description:, date_available:,
                  booked:, owner_id:, price:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, date_available, \
        booked, owner_id, price) \
       VALUES('#{name}', '#{description}', '#{date_available}', '#{booked}', \
        '#{owner_id}', '#{price}') \
       RETURNING id, name, description, date_available, booked, \
        owner_id, price;"
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
      owner_id: result['owner_id'],
      price: result['price']
    )
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces;')

    result.map do |space|
      build_space(space)
    end
  end

  attr_accessor :id, :name, :description, :date_available
  attr_accessor :booked, :owner_id, :price

  def initialize(
    id:, name:, description:, date_available:,
    booked:, owner_id:, price:
  )
    @id = id
    @name = name
    @description = description
    @date_available = date_available
    @booked = booked
    @owner_id = owner_id
    @price = price
  end
end
