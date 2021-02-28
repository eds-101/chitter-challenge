require 'pg'

class Peeps

  attr_reader :id, :peep, :time, :sender

  def initialize(id:, peep:, time:, sender:)
    @id = id
    @peep = peep
    @time = time
    @sender = sender
  end

  def self.history
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peeps.new( id: peep('id'), peep: peep('peep'), time: peep('time'), sender: peep('sender') )
    end
  end

end