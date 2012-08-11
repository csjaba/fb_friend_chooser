class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :uid
      t.string :token

      t.timestamps
    end
  end
end
