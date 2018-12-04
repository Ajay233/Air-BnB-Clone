require 'pg'
require 'bcrypt'
require_relative '../database_connection'
require 'pry'

class User

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

     result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) \
                              VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') \
                              RETURNING id, name, username, email;").first

     build_user(result)
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';").first
    build_user(result)
  end

  def self.build_user(result)
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
