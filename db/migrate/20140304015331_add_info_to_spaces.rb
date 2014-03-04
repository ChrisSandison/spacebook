class AddInfoToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :address, :string
    add_column :spaces, :city, :string
    add_column :spaces, :region_id, :integer
  end
end
