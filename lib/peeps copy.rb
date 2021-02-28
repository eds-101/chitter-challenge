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



end