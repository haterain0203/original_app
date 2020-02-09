# require 'test_helper'

# class ConditionTest < ActiveSupport::TestCase
#   def setup
#     @condition = Condition.new(condition_date: "2020/02/09", meal: 1, defecation:1, sleep:1, alcohol:1, exercise:1, stress:1, user_id: 1)
#   end
  
#   test "should be valid?" do
#     assert @condition.valid?
#   end
  
#   test "meal should be present" do
#     @condition.meal = " "
#     assert_not @condition.valid?
#   end
  
#   test "defecation should be present" do
#     @condition.defecation = " "
#     assert_not @condition.valid?
#   end
  
#   test "sleep should be present" do
#     @condition.sleep = " "
#     assert_not @condition.valid?
#   end
  
#   test "alcohol should be present" do
#     @condition.alcohol = " "
#     assert_not @condition.valid?
#   end
  
#   test "exercise should be present" do
#     @condition.exercise = " "
#     assert_not @condition.valid?
#   end
  
#   test "stress should be present" do
#     @condition.stress = " "
#     assert_not @condition.valid?
#   end
  
#   test "sleep should not be too big" do
#     @condition.sleep = 6
#     assert_not @condition.valid?
#   end
  
# end
