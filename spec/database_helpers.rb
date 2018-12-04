require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec('TRUNCATE users;')
end

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'makers_bnb_test')
#   result = connection.query("SELECT * FROM users WHERE id = #{id};")
#   result.first
# end
