feature 'posting messages' do
  scenario 'user can post a new message' do
    visit '/'
    fill_in 'name', with: 'Ed'
    fill_in 'peep', with: 'My first peep.'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
  end
end