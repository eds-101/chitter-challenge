feature "Viewing peeps" do
  scenario "a user can see peep messages" do
    visit '/'
    expect(page).to have_content "Dorito's are really tasty"
    expect(page).to have_content "Ghetts reached number 2 this week"
    expect(page).to have_content "Suns out, guns out baby!"
  end
end 