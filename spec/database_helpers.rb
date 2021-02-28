require 'pg'
require '../lib/peeps'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter2_test')
  result = connection.query("SELECT * FROM messages WHERE id = #{id};")
  result.first
end