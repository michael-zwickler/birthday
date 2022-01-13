feature 'Shows the birthday countdown' do
  scenario 'when the birthday is not today' do
    t = Time.now - (60*60*24)
    day_str = t.strftime("%d")
    month_str = t.strftime("%B")

    visit "/"
    fill_in('user_name', with: "John")
    select(day_str, from: "day")
    select(month_str, from: "month")
    click_button('Submit')
    expect(page).to have_content("Hello John, your birthday is in")
  end 
end