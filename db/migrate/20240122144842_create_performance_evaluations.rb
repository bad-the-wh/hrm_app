class CreatePerformanceEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :performance_evaluations do |t|

      t.date :evaluation_date
      t.references :employee_reviewed, foreign_key: { to_table: :employees, column: :LDAP }
      t.references :reviewer, foreign_key: { to_table: :employees, column: :LDAP }
      t.integer :note
      t.text :commentary

      t.timestamps
    end
  end
end
