# Request class
require_relative 'space'

class Request

  def self.create(space_id:, requester_id:)

    space_data = Space.find(id: space_id)
    space = Space.build_space(space_data)
    result = DatabaseConnection.query(
      "INSERT INTO requests (space_id, approval_status, requester_id)
      VALUES('#{space_id}', 'Pending', '#{requester_id}')
      RETURNING id, space_id, approval_status, requester_id;"
    ).first
    Request.build_request(result)
  end

  def self.build_request(result)
    Request.new(
      id: result['id'].to_i,
      space_id: result['space_id'].to_i,
      approval_status: result['approval_status'],
      requester_id: result['requester_id'].to_i,
    )
  end

  attr_accessor :id, :space_id, :approval_status, :requester_id

  def initialize(id:, space_id:, approval_status:, requester_id:)
    @id = id
    @space_id = space_id
    @approval_status = approval_status
    @requester_id = requester_id
  end
end
