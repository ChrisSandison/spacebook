class ChangeSpaceRegionIdToString < ActiveRecord::Migration
  def change
    remove_column :spaces, :region_id
    add_column :spaces, :province, :string
  end
end
