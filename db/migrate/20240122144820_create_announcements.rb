class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements do |t|

      t.date :publication_date
      t.string :title
      t.text :message
      t.references :posted_by, foreign_key: { to_table: :employees, column: :LDAP}
      t.references :concerned_position, foreign_key: { to_table: :employees, column: :position }

      t.timestamps
    end
  end
end
