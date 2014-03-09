class AddWebsiteToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :website, :string
  end
end
