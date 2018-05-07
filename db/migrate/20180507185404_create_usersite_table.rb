class CreateUsersiteTable < ActiveRecord::Migration[5.0]
  def change
    create_table :usersite do |t|
      t.integer :user_id
      t.integer :site_id
    end
  end
end
