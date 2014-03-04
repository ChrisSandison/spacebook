class MoveRegionIdToCode < ActiveRecord::Migration
  def change
      add_column :regions, :country_id, :integer
      add_column :regions, :name, :text
      add_column :regions, :region_code,  :text
  end
end
