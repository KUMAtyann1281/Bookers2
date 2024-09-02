class AddValidationToTitle < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :title, :string, null: false
  end
end
