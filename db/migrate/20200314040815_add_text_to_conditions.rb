class AddTextToConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :text, :string
  end
end
