class ChangeReviewTypes < ActiveRecord::Migration
  def change
    remove_column :reviews, :would_attend
    remove_column :reviews, :would_book
    add_column :reviews, :would_attend, :boolean
    add_column :reviews, :would_book, :boolean
  end
end
