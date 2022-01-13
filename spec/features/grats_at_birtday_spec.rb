feature 'Grats the user' do
  scenario 'when the birthday is today' do
    t = Time.now
    day_str = t.strftime("%d")
    month_str = t.strftime("%B")
    
    visit "/"
    fill_in('user_name', with: "John")
    select(day_str, from: "day")
    select(month_str, from: "month")
    click_button('Submit')
    expect(page).to have_content("Happy Birthday, John!")
  end
end