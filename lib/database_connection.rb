require 'pg'

# This class handles Database connection and queries
class DatabaseConnection
  attr_reader :connection

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(string)
    @connection.exec(string)
  end
end
