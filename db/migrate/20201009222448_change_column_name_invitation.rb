class ChangeColumnNameInvitation < ActiveRecord::Migration[6.0]
  def change
    remove_column :invitations, :user_event_id    
    remove_column :invitations, :event_user_id 
    add_column :invitations, :event_id, :integer
    add_column :invitations, :user_id, :integer
  end
end
