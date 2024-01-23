class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|

      t.integer :LDAP
      t.string :name
      t.string :email
      t.string :position
      t.date :birthdate

      t.timestamps
    end
  end
end
