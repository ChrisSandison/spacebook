class AddVariousFieldsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :event_id, :integer
    add_column :reviews, :atmosphere, :text
    add_column :reviews, :accesability, :string
    add_column :reviews, :would_attend, :integer
    add_column :reviews, :would_book, :integer
  end
end
