require "application_system_test_case"

class PmsTest < ApplicationSystemTestCase
  setup do
    @pm = pms(:one)
  end

  test "visiting the index" do
    visit pms_url
    assert_selector "h1", text: "Pms"
  end

  test "should create pm" do
    visit pms_url
    click_on "New pm"

    check "Read" if @pm.read
    fill_in "Sender", with: @pm.sender
    fill_in "Subject", with: @pm.subject
    check "Torolt" if @pm.torolt
    fill_in "User", with: @pm.user
    check "Warn" if @pm.warn
    click_on "Create Pm"

    assert_text "Pm was successfully created"
    click_on "Back"
  end

  test "should update Pm" do
    visit pm_url(@pm)
    click_on "Edit this pm", match: :first

    check "Read" if @pm.read
    fill_in "Sender", with: @pm.sender
    fill_in "Subject", with: @pm.subject
    check "Torolt" if @pm.torolt
    fill_in "User", with: @pm.user
    check "Warn" if @pm.warn
    click_on "Update Pm"

    assert_text "Pm was successfully updated"
    click_on "Back"
  end

  test "should destroy Pm" do
    visit pm_url(@pm)
    click_on "Destroy this pm", match: :first

    assert_text "Pm was successfully destroyed"
  end
end
