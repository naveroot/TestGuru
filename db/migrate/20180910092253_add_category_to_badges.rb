class AddCategoryToBadges < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :category, on_delete: :cascade
  end
end
