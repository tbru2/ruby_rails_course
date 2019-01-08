class AddIdToTodoList < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :id, :integer
  end
end
