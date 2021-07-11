class AddUserIdColumnToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :user_id, :bigint
  end
end
