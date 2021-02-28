require 'pg'

class Peeps

  attr_reader :id, :username, :message, :time

  def initialize(id:, username:, message:, time:)
    @id = id
    @username = username
    @message = message
    @time = time
  end

  def self.feed
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end
   
    result = connection.exec("SELECT * FROM messages;")
    result.map do |peep|
      Peeps.new( id: peep['id'], username: peep['username'], message: peep['message'], time: peep['time'] )
    end
  end

  def self.create(username:, peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter2_test')
    else
      connection = PG.connect(dbname: 'chitter2')
    end
    result = connection.exec("INSERT INTO messages (username, message, time) VALUES('#{username}', '#{peep}', current_timestamp);")
    # Peeps.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'], time: result[0]['time'] )
  end


end