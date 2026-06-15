class AddStaffIdToPrepTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :prep_tasks, :staff_id, :integer
  end
end
