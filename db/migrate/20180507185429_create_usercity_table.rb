class CreateUsercityTable < ActiveRecord::Migration[5.2]
  def change
    create_table :usercities do |t|
      t.integer :city_id
      t.integer :user_id
    end
  end
end
