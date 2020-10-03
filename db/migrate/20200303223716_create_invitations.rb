class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :attending, default: false
      t.timestamps
    end
    add_foreign_key :invitations, :events, column: :event_id
    add_foreign_key :invitations, :users, column: :user_id
  end
end
