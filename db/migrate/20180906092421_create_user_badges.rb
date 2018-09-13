class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.references :badge, foreign_key: true, on_delete: :cascade

    end
  end
end
