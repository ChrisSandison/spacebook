class AddCreatedByUserToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :created_by_user, :integer
  end
end
