require 'pg'

feature 'View peep messages' do
  scenario 'a user can see test peeps' do
    connection = PG.connect(dbname: 'chitter2_test')
    connection.exec("INSERT INTO messages (username, message, time) VALUES ('Miles', 'Love this Game', current_timestamp);")

    visit '/'
    expect(page).to have_content 'Love this Game'
  end
end