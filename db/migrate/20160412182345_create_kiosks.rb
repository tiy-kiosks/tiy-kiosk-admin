class CreateKiosks < ActiveRecord::Migration
  def change
    create_table :kiosks do |t|
      t.string :name, unique: true, allow_nil: false
      t.string :background_photo_id

      t.timestamps null: false
    end
  end
end
