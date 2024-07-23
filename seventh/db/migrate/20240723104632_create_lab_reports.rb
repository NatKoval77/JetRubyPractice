class CreateLabReports < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_reports do |t|
      t.string :user_id, null:false
      t.string :title, null:false
      t.text :description
      t.string :grade

      t.timestamps
    end
  end
end
