class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, allow_nil: false
      t.string :password_digest, allow_nil: false

      t.timestamps null: false
    end
  end
end
