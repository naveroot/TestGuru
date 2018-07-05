class CreateTestsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tests_users do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :status, default: 'not_started', null: false

      t.timestamps
    end
  end
end
