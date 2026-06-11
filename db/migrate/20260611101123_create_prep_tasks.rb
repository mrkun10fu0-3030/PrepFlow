class CreatePrepTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :prep_tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :target_qty
      t.integer :actual_qty
      t.date :prep_date
      t.text :comment
      t.boolean :completed

      t.timestamps
    end
  end
end
