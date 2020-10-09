class AddIndexToEventsForEventIdUserId < ActiveRecord::Migration[6.0]
  def change
    add_index :invitations, :event_id
    add_index :invitations, :user_id
  end
end
