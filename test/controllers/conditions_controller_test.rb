# require 'test_helper'

# class ConditionsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @condition = conditions(:one)
#   end

#   test "should get index" do
#     get conditions_url
#     assert_response :success
#   end

#   test "should get new" do
#     get new_condition_url
#     assert_response :success
#   end

#   test "should create condition" do
#     assert_difference('Condition.count') do
#       post conditions_url, params: { condition: { alcohol: @condition.alcohol, condition_date: @condition.condition_date, defecation: @condition.defecation, exercise: @condition.exercise, meal: @condition.meal, sleep: @condition.sleep, stress: @condition.stress, user_id: @condition.user_id } }
#     end

#     assert_redirected_to condition_url(Condition.last)
#   end

#   test "should show condition" do
#     get condition_url(@condition)
#     assert_response :success
#   end

#   test "should get edit" do
#     get edit_condition_url(@condition)
#     assert_response :success
#   end

#   test "should update condition" do
#     patch condition_url(@condition), params: { condition: { alcohol: @condition.alcohol, condition_date: @condition.condition_date, defecation: @condition.defecation, exercise: @condition.exercise, meal: @condition.meal, sleep: @condition.sleep, stress: @condition.stress, user_id: @condition.user_id } }
#     assert_redirected_to condition_url(@condition)
#   end

#   test "should destroy condition" do
#     assert_difference('Condition.count', -1) do
#       delete condition_url(@condition)
#     end

#     assert_redirected_to conditions_url
#   end
# end
