class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.references :kiosk, index: true, foreign_key: true
      t.integer :order_number, default: 99
      t.date :start_date
      t.date :end_date
      t.string :pattern, default: "markdown"
      t.string :markdown_content

      t.timestamps null: false
    end
  end
end
