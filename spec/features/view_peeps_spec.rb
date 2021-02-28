require 'pg'

feature 'View peep messages' do

  let(:test_time) { Time.now.strftime("%d-%m-%Y") } # "dd/mm/yyyy"
  let(:test_time) { Time.now.strftime("%Y-%m-%d") } # "yyyy/mm/dd"

  scenario 'a user can see peeps and time posted' do
    connection = PG.connect(dbname: 'chitter2_test')
    connection.exec("INSERT INTO messages (username, message, time) VALUES ('Miles', 'Love this Game', current_timestamp);")

    visit '/'
    expect(page).to have_content 'Love this Game'
    expect(page).to have_content "#{test_time}"
  end

end