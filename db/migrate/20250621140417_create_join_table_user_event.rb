class CreateJoinTableUserEvent < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.timestamps
    end
    add_reference :attendances, :attendee, null: false, foreign_key: { to_table: :users }
    add_reference :attendances, :attended_event, null: false, foreign_key: { to_table: :events }
    add_index :attendances, [ :attendee_id, :attended_event_id ], unique: true
  end
end
