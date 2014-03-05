class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :content
      t.datetime :takes_place_at
      t.references :space, index: true

      t.timestamps
    end
  end
end
