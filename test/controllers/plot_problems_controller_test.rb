require 'test_helper'

class PlotProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plot_problem = plot_problems(:one)
  end

  test "should get index" do
    get plot_problems_url
    assert_response :success
  end

  test "should get new" do
    get new_plot_problem_url
    assert_response :success
  end

  test "should create plot_problem" do
    assert_difference('PlotProblem.count') do
      post plot_problems_url, params: { plot_problem: { comment: @plot_problem.comment, plot_id: @plot_problem.plot_id, problem_id: @plot_problem.problem_id } }
    end

    assert_redirected_to plot_problem_url(PlotProblem.last)
  end

  test "should show plot_problem" do
    get plot_problem_url(@plot_problem)
    assert_response :success
  end

  test "should get edit" do
    get edit_plot_problem_url(@plot_problem)
    assert_response :success
  end

  test "should update plot_problem" do
    patch plot_problem_url(@plot_problem), params: { plot_problem: { comment: @plot_problem.comment, plot_id: @plot_problem.plot_id, problem_id: @plot_problem.problem_id } }
    assert_redirected_to plot_problem_url(@plot_problem)
  end

  test "should destroy plot_problem" do
    assert_difference('PlotProblem.count', -1) do
      delete plot_problem_url(@plot_problem)
    end

    assert_redirected_to plot_problems_url
  end
end
