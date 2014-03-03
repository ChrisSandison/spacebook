class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.info :contact

      t.timestamps
    end
  end
end
