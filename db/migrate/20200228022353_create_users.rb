class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
     add_index :users, [:user_id, :created_at]
  end
end
