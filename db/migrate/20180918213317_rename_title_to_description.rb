class RenameTitleToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column(:tasks, :title, :description)
  end
end
