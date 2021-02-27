require './lib/peeps'

describe Peeps do
  describe '.history' do
    it 'returns history of posted peeps' do
      peeps = Peeps.history

      expect(peeps).to include "Dorito's are really tasty"
      expect(peeps).to include "Ghetts reached number 2 this week"
      expect(peeps).to include "Suns out, guns out baby!"
    end
  end
end