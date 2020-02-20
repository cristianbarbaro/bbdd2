require "application_system_test_case"

class PlotProblemsTest < ApplicationSystemTestCase
  setup do
    @plot_problem = plot_problems(:one)
  end

  test "visiting the index" do
    visit plot_problems_url
    assert_selector "h1", text: "Plot Problems"
  end

  test "creating a Plot problem" do
    visit plot_problems_url
    click_on "New Plot Problem"

    fill_in "Comment", with: @plot_problem.comment
    fill_in "Plot", with: @plot_problem.plot_id
    fill_in "Problem", with: @plot_problem.problem_id
    click_on "Create Plot problem"

    assert_text "Plot problem was successfully created"
    click_on "Back"
  end

  test "updating a Plot problem" do
    visit plot_problems_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @plot_problem.comment
    fill_in "Plot", with: @plot_problem.plot_id
    fill_in "Problem", with: @plot_problem.problem_id
    click_on "Update Plot problem"

    assert_text "Plot problem was successfully updated"
    click_on "Back"
  end

  test "destroying a Plot problem" do
    visit plot_problems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plot problem was successfully destroyed"
  end
end
