require 'pg'

feature "Posting peeps to Chitter" do
  scenario "a user can post a message to Chitter" do
    connection = PG.connect(dbname: 'chitter_test')

    visit '/'

    fill_in 'name', with: 'Eds'
    fill_in 'peep', with: 'My first peep, its an honour!'

    click_button 'Post Peep'

    expect(page).to have_content "Eds"
    expect(page).to have_content "My first peep, its an honour!"

  end
end