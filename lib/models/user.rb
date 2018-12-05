require 'pg'
require 'bcrypt'
require_relative '../database_connection'
require 'pry'

# User class
class User
  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) \
       VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') \
       RETURNING id, name, username, email;"
    ).first
    build_user(result)
  end

  def self.find(id:)
    return nil unless id

    result = select_by(column: 'id', value: id)
    build_user(result)
  end

  def self.authenticate(email:, password:)
    result = select_by(column: 'email', value: email)
    build_user(result) if result && password_check(
      password: password,
      result: result
    )
  end

  def self.select_by(column:, value:)
    DatabaseConnection.query(
      "SELECT * FROM users \
      WHERE #{column} = '#{value}';"
    ).first
  end

  def self.password_check(password:, result:)
    BCrypt::Password.new(result['password']) == password
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

  def spaces
    results = DatabaseConnection.query("SELECT * FROM spaces WHERE owner_id = #{id};")
    results.map { |result| Space.build_space(result) }
  end
end
