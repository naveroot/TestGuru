class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :title
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
