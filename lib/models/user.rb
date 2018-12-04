require 'pg'
require_relative '../database_connection'

class User

  def self.create(name:, username:, email:, password:)
     result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) \
                              VALUES('#{name}', '#{username}', '#{email}', '#{password}') \
                              RETURNING id, name, username, email;").first

     User.new(id: result['id'], name: result['name'],
              username: result['username'], email: result['email'])
  end

  attr_accessor :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end
end
