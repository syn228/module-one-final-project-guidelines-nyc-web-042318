class ChangeTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :usersite, :usersites
    rename_table :usercity, :usercities
  end
end
