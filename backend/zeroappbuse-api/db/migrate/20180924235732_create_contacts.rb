class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mobilephone_number
      t.string :email
      t.belongs_to :user, index: true

      t.timestamps
    end
    #add_foreign_key :contacts, :users
  end
end
