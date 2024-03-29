class CreateLeaveRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :leave_requests do |t|

      t.references :employee, foreign_key: { to_table: :employees, column: :LDAP }
      t.string :reason
      t.date :leave_start_date
      t.date :leave_end_date
      t.string :response, default: 'pending'

      t.timestamps
    end
  end
end
