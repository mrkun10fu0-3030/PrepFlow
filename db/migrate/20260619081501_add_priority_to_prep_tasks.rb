class AddPriorityToPrepTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :prep_tasks, :priority, :integer, default: 1
  end
end
