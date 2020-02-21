require "application_system_test_case"

class CropsTest < ApplicationSystemTestCase
  setup do
    @crop = crops(:one)
  end

  test "visiting the index" do
    visit crops_url
    assert_selector "h1", text: "Crops"
  end

  test "creating a Crop" do
    visit crops_url
    click_on "New Crop"

    fill_in "Amount", with: @crop.amount
    fill_in "Comment", with: @crop.comment
    fill_in "Plot", with: @crop.plot_id
    fill_in "Variety", with: @crop.variety_id
    click_on "Create Crop"

    assert_text "Crop was successfully created"
    click_on "Back"
  end

  test "updating a Crop" do
    visit crops_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @crop.amount
    fill_in "Comment", with: @crop.comment
    fill_in "Plot", with: @crop.plot_id
    fill_in "Variety", with: @crop.variety_id
    click_on "Update Crop"

    assert_text "Crop was successfully updated"
    click_on "Back"
  end

  test "destroying a Crop" do
    visit crops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crop was successfully destroyed"
  end
end