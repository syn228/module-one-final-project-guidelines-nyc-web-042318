class CreateSitesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :type
    end
  end
end
