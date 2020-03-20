class AddSkinConditionToConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :skin_condition, :integer
  end
end
