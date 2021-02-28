# require 'pg'
# require '../lib/peeps'
# require 'database_helpers'

# describe '.feed' do
#   it 'returns a list of all peeps/messages' do
#     connection = PG.connect(dbname: 'chitter2_test')

#     # Add test data
#     peep_1 = Peeps.create(username: "Mark", peep: "Love to peep")
#     Peeps.create(username: "Dave", peep: "Baille Funk rules")
#     Peeps.create(username: "Angus", peep: "I love burgers")

#     test_peeps = Peeps.feed

#     expect(test_peeps.length).to eq 3
#     expect(test_peeps.first).to be_a Peeps
#     expect(test_peeps.first.id).to eq peep_1.id
#     expect(first_peep.first.message).to eq 'Love to peep'
#     expect(first_peep.first.username).to eq 'Mark'
#   end
# end

# describe '.create' do
#   it 'creates a new peep' do
#     peep = Peeps.create(username: "Angelina", peep: "I like ice cream")
#     persisted_data = persisted_data(id: peep.id)

#     expect(peep).to be_a Peeps
#     expect(peep.id).to eq persisted_data['id']
#     expect(peep.message).to eq 'I like ice cream'
#     expect(peep.username).to eq 'Angelina'
#   end
# end
  
