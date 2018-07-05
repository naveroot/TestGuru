class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1, null: false
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
