class ChangeLinkAtGists < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :link, :link_hash
  end
end
