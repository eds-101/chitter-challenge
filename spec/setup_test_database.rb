require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'chitter2_test')

  # Clear test messages table before running tests
  connection.exec('TRUNCATE messages;')
end