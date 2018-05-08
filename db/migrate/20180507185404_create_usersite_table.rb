class CreateUsersiteTable < ActiveRecord::Migration[5.2]
  def change
    create_table :usersites do |t|
      t.integer :user_id
      t.integer :site_id
    end
  end
end
