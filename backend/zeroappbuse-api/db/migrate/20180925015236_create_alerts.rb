class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.text :description
      t.string :latitude
      t.string :longitude
      t.text :geodata
      t.belongs_to :user, index: true

      t.timestamps
    end
    #add_foreign_key :alerts, :users
  end
end
