require 'pg'

class Peeps
  def self.feed
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end
   
    result = connection.exec("SELECT * FROM messages;")
    result.map { |peep| peep ['message'] }
  end

  def self.new(username:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end
    connection.exec("INSERT INTO messages (username, message, time) VALUES('#{username}', '#{peep}', current_timestamp);")

  end


end