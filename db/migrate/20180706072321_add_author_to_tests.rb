class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, refereces: :users
  end
end
