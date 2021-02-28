require './lib/peeps'

describe Peeps do
  describe '.history' do
    it 'returns history of posted peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      #add test data
      connection.exec("INSERT INTO peeps (sender, peep, time) VALUES( 'Marcus', 'Doritos are really tasty', current_timestamp);")
      connection.exec("INSERT INTO peeps (sender, peep, time) VALUES( 'Laila', 'Suns out', current_timestamp);")
      connection.exec("INSERT INTO peeps (sender, peep, time) VALUES( 'Jacques', 'Missing real life tbh', current_timestamp);")

      peeps = Peeps.history
      
      expect(peeps).to include "Doritos are really tasty"
      expect(peeps).to include "Missing real life tbh"
      expect(peeps).to include "Suns out"
    end
  end
end