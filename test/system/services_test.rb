require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "creating a Service" do
    visit services_url
    click_on "New Service"

    fill_in "Closing time", with: @service.closing_time
    fill_in "Date", with: @service.date
    fill_in "Female attendance", with: @service.female_attendance
    fill_in "Male attendance", with: @service.male_attendance
    fill_in "Number of new comers", with: @service.number_of_new_comers
    fill_in "Offertory amount", with: @service.offertory_amount
    fill_in "Starting time", with: @service.starting_time
    fill_in "Tithe amount", with: @service.tithe_amount
    fill_in "Type", with: @service.type
    click_on "Create Service"

    assert_text "Service was successfully created"
    click_on "Back"
  end

  test "updating a Service" do
    visit services_url
    click_on "Edit", match: :first

    fill_in "Closing time", with: @service.closing_time
    fill_in "Date", with: @service.date
    fill_in "Female attendance", with: @service.female_attendance
    fill_in "Male attendance", with: @service.male_attendance
    fill_in "Number of new comers", with: @service.number_of_new_comers
    fill_in "Offertory amount", with: @service.offertory_amount
    fill_in "Starting time", with: @service.starting_time
    fill_in "Tithe amount", with: @service.tithe_amount
    fill_in "Type", with: @service.type
    click_on "Update Service"

    assert_text "Service was successfully updated"
    click_on "Back"
  end

  test "destroying a Service" do
    visit services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service was successfully destroyed"
  end
end
