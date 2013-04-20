require 'test_helper'

class GroupMealsControllerTest < ActionController::TestCase
  setup do
    @group_meal = group_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_meal" do
    assert_difference('GroupMeal.count') do
      post :create, group_meal: { meal: @group_meal.meal, proposed_end_time: @group_meal.proposed_end_time, proposed_start_time: @group_meal.proposed_start_time, set_end_time: @group_meal.set_end_time, set_start_time: @group_meal.set_start_time }
    end

    assert_redirected_to group_meal_path(assigns(:group_meal))
  end

  test "should show group_meal" do
    get :show, id: @group_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_meal
    assert_response :success
  end

  test "should update group_meal" do
    put :update, id: @group_meal, group_meal: { meal: @group_meal.meal, proposed_end_time: @group_meal.proposed_end_time, proposed_start_time: @group_meal.proposed_start_time, set_end_time: @group_meal.set_end_time, set_start_time: @group_meal.set_start_time }
    assert_redirected_to group_meal_path(assigns(:group_meal))
  end

  test "should destroy group_meal" do
    assert_difference('GroupMeal.count', -1) do
      delete :destroy, id: @group_meal
    end

    assert_redirected_to group_meals_path
  end
end
