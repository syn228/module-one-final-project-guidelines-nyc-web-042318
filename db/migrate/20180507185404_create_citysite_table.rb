class CreateCitysiteTable < ActiveRecord::Migration[5.0]
  def change
    create_table :citysite do |t|
      t.integer :city_id
      t.integer :site_id
    end
  end
end
