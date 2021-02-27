require 'pg'

feature "Viewing peeps" do
  scenario "a user can see peep messages" do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Marcus', 'Doritos are really tasty', current_timestamp);")
    connection.exec("INSERT INTO peeps VALUES(2, 'Laila', 'Suns out', current_timestamp);")
    connection.exec("INSERT INTO peeps VALUES(3, 'Jacques', 'Missing real life tbh', current_timestamp);")

    visit '/'

    expect(page).to have_content "Doritos are really tasty"
    expect(page).to have_content "Missing real life tbh"
    expect(page).to have_content "Suns out"
    
  end
end 