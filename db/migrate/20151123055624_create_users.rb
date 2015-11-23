class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
