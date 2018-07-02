# frozen_string_literal: true

class CreateJoinTableTestsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tests, :users do |t|
      t.string :status, default: 'in_progress'
      t.timestamps
    end
  end
end
