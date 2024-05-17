require "application_system_test_case"

class Public::HomesTest < ApplicationSystemTestCase
  setup do
    @public_home = public_homes(:one)
  end

  test "visiting the index" do
    visit public_homes_url
    assert_selector "h1", text: "Public/Homes"
  end

  test "creating a Home" do
    visit public_homes_url
    click_on "New Public/Home"

    fill_in "Top", with: @public_home.top
    click_on "Create Home"

    assert_text "Home was successfully created"
    click_on "Back"
  end

  test "updating a Home" do
    visit public_homes_url
    click_on "Edit", match: :first

    fill_in "Top", with: @public_home.top
    click_on "Update Home"

    assert_text "Home was successfully updated"
    click_on "Back"
  end

  test "destroying a Home" do
    visit public_homes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home was successfully destroyed"
  end
end
