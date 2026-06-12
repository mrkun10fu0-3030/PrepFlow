class ChangeQtyColumnsTypeInPrepTasks < ActiveRecord::Migration[8.1]
  def change
    change_column :prep_tasks, :target_qty, :string
    change_column :prep_tasks, :actual_qty, :string
  end
end
