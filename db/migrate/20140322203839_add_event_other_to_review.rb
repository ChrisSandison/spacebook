class AddEventOtherToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :event_other, :string
  end
end
