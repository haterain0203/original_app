require "application_system_test_case"

class ConditionsTest < ApplicationSystemTestCase
  setup do
    @condition = conditions(:one)
  end

  test "visiting the index" do
    visit conditions_url
    assert_selector "h1", text: "Conditions"
  end

  test "creating a Condition" do
    visit conditions_url
    click_on "New Condition"

    fill_in "Alcohol", with: @condition.alcohol
    fill_in "Condition date", with: @condition.condition_date
    fill_in "Defecation", with: @condition.defecation
    fill_in "Exercise", with: @condition.exercise
    fill_in "Meal", with: @condition.meal
    fill_in "Sleep", with: @condition.sleep
    fill_in "Stress", with: @condition.stress
    fill_in "User", with: @condition.user_id
    click_on "Create Condition"

    assert_text "Condition was successfully created"
    click_on "Back"
  end

  test "updating a Condition" do
    visit conditions_url
    click_on "Edit", match: :first

    fill_in "Alcohol", with: @condition.alcohol
    fill_in "Condition date", with: @condition.condition_date
    fill_in "Defecation", with: @condition.defecation
    fill_in "Exercise", with: @condition.exercise
    fill_in "Meal", with: @condition.meal
    fill_in "Sleep", with: @condition.sleep
    fill_in "Stress", with: @condition.stress
    fill_in "User", with: @condition.user_id
    click_on "Update Condition"

    assert_text "Condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Condition" do
    visit conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Condition was successfully destroyed"
  end
end
