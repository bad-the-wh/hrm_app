class CreatePerformanceEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :performance_evaluations do |t|

      t.date :evaluation_date
      t.references :employee_reviewed, foreign_key: { to_table: :employees }
      t.references :reviewer, foreign_key: { to_table: :employees }
      t.integer :note
      t.text :commentary

      t.timestamps
    end
  end
end
