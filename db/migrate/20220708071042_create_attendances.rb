class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    drop_table :attendances
    create_table :attendances do |t|
      t.belongs_to :attendee
      t.belongs_to :attended_event

      t.timestamps
    end
  end
end
