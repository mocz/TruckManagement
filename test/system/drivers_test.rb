require "application_system_test_case"

class DriversTest < ApplicationSystemTestCase
  setup do
    @driver = drivers(:one)
  end

  test "visiting the index" do
    visit drivers_url
    assert_selector "h1", text: "Drivers"
  end

  test "should create driver" do
    visit drivers_url
    click_on "New driver"

    fill_in "Address", with: @driver.address
    fill_in "Birthdate", with: @driver.birthdate
    fill_in "Contact number", with: @driver.contact_number
    fill_in "License number", with: @driver.license_number
    fill_in "Name", with: @driver.name
    fill_in "Status", with: @driver.status
    click_on "Create Driver"

    assert_text "Driver was successfully created"
    click_on "Back"
  end

  test "should update Driver" do
    visit driver_url(@driver)
    click_on "Edit this driver", match: :first

    fill_in "Address", with: @driver.address
    fill_in "Birthdate", with: @driver.birthdate
    fill_in "Contact number", with: @driver.contact_number
    fill_in "License number", with: @driver.license_number
    fill_in "Name", with: @driver.name
    fill_in "Status", with: @driver.status
    click_on "Update Driver"

    assert_text "Driver was successfully updated"
    click_on "Back"
  end

  test "should destroy Driver" do
    visit driver_url(@driver)
    click_on "Destroy this driver", match: :first

    assert_text "Driver was successfully destroyed"
  end
end
