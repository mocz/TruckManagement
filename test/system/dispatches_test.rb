require "application_system_test_case"

class DispatchesTest < ApplicationSystemTestCase
  setup do
    @dispatch = dispatches(:one)
  end

  test "visiting the index" do
    visit dispatches_url
    assert_selector "h1", text: "Dispatches"
  end

  test "should create dispatch" do
    visit dispatches_url
    click_on "New dispatch"

    fill_in "Description", with: @dispatch.description
    fill_in "Gross weight", with: @dispatch.gross_weight
    fill_in "Location", with: @dispatch.location_id
    fill_in "Planter", with: @dispatch.planter_id
    fill_in "Receive date", with: @dispatch.receive_date
    fill_in "Status", with: @dispatch.status
    fill_in "Truck", with: @dispatch.truck_id
    click_on "Create Dispatch"

    assert_text "Dispatch was successfully created"
    click_on "Back"
  end

  test "should update Dispatch" do
    visit dispatch_url(@dispatch)
    click_on "Edit this dispatch", match: :first

    fill_in "Description", with: @dispatch.description
    fill_in "Gross weight", with: @dispatch.gross_weight
    fill_in "Location", with: @dispatch.location_id
    fill_in "Planter", with: @dispatch.planter_id
    fill_in "Receive date", with: @dispatch.receive_date
    fill_in "Status", with: @dispatch.status
    fill_in "Truck", with: @dispatch.truck_id
    click_on "Update Dispatch"

    assert_text "Dispatch was successfully updated"
    click_on "Back"
  end

  test "should destroy Dispatch" do
    visit dispatch_url(@dispatch)
    click_on "Destroy this dispatch", match: :first

    assert_text "Dispatch was successfully destroyed"
  end
end
