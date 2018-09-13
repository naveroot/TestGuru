class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :badge_image, null: false
      t.integer :rule, null: false
      t.string :description
      t.string :rule_params

      t.timestamps
    end
  end
end
