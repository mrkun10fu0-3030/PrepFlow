require "test_helper"

class PrepTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @prep_task = prep_tasks(:one)
  end

  test "should get index" do
    get prep_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_prep_task_url
    assert_response :success
  end

  test "should create prep_task" do
    assert_difference("PrepTask.count") do
      post prep_tasks_url, params: { prep_task: { actual_qty: @prep_task.actual_qty, comment: @prep_task.comment, completed: @prep_task.completed, prep_date: @prep_task.prep_date, target_qty: @prep_task.target_qty, title: @prep_task.title, user_id: @prep_task.user_id } }
    end
    assert_redirected_to prep_task_url(PrepTask.last)
  end

  test "should show prep_task" do
    get prep_task_url(@prep_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_prep_task_url(@prep_task)
    assert_response :success
  end

  test "should update prep_task" do
    patch prep_task_url(@prep_task), params: { prep_task: { actual_qty: @prep_task.actual_qty, comment: @prep_task.comment, completed: @prep_task.completed, prep_date: @prep_task.prep_date, target_qty: @prep_task.target_qty, title: @prep_task.title, user_id: @prep_task.user_id } }
    assert_redirected_to prep_task_url(@prep_task)
  end

  test "should destroy prep_task" do
    assert_difference("PrepTask.count", -1) do
      delete prep_task_url(@prep_task)
    end
    assert_redirected_to prep_tasks_url
  end
end