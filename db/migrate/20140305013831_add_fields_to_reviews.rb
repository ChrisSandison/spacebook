class AddFieldsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :created_by_name, :string
    add_column :reviews, :user_id, :integer 
  end
end
