require "rails_helper"

describe "user sees info for nearest station" do
  scenario "they search by zip code" do
    visit "/"
    fill_in 'search', with: 80203
    click_on "Locate"


    fill_in('First Name', :with => 'John')

    expect(current_path).to eq("/search")
    expect(page).to have_content "Electric"
    expect(page).to have_content "Propane"
    expect(page).to have_content "Name"
    expect(page).to have_content "Address"
    expect(page).to have_content "Fuel Types"
    expect(page).to have_content "Distance"
    expect(page).to have_content "Access Times"
  end
end
