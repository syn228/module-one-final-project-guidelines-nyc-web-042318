class CreateSitesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :place_type
    end
  end
end
