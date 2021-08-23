require "application_system_test_case"

class QuoteOfTheDaysTest < ApplicationSystemTestCase
  setup do
    @quote_of_the_day = quote_of_the_days(:one)
  end

  test "visiting the index" do
    visit quote_of_the_days_url
    assert_selector "h1", text: "Quote Of The Days"
  end

  test "creating a Quote of the day" do
    visit quote_of_the_days_url
    click_on "New Quote Of The Day"

    fill_in "Author", with: @quote_of_the_day.author
    fill_in "Date to air", with: @quote_of_the_day.date_to_air
    fill_in "Quote", with: @quote_of_the_day.quote
    fill_in "Title", with: @quote_of_the_day.title
    click_on "Create Quote of the day"

    assert_text "Quote of the day was successfully created"
    click_on "Back"
  end

  test "updating a Quote of the day" do
    visit quote_of_the_days_url
    click_on "Edit", match: :first

    fill_in "Author", with: @quote_of_the_day.author
    fill_in "Date to air", with: @quote_of_the_day.date_to_air
    fill_in "Quote", with: @quote_of_the_day.quote
    fill_in "Title", with: @quote_of_the_day.title
    click_on "Update Quote of the day"

    assert_text "Quote of the day was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote of the day" do
    visit quote_of_the_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote of the day was successfully destroyed"
  end
end
