class AddGroupSizeToClassrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :classrooms, :group_size, :integer
  end
end
