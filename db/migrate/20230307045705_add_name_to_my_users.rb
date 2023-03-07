class AddNameToMyUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :my_users, :name, :string
    add_column :my_users, :surname, :string
  end
end
