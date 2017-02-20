require 'rails_helper'

describe "Places" do
  before :each do
    allow(BeermappingApi).to receive(:fetch_weather).and_return(
        Weather.new(current: { "condition" => { "text" => "sunny", "icon" => ""},
                               "temp_c" => -5
        })
    )

  end

  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [Place.new(name: "Oljenkorsi", id: 1)]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if many is returned by the API, they are shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [Place.new(name: "Oljenkorsi", id: 1),
         Place.new(name: "Gurula", id: 2),
         Place.new(name: "Resonanssi", id: 3)]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Gurula"
    expect(page).to have_content "Resonanssi"
  end

  it "if none is returned by the API, notice is shown on page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        []
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "No locations in kumpula"
  end
end