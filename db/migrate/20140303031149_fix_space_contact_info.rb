class FixSpaceContactInfo < ActiveRecord::Migration
  def change
    rename_column :spaces, :contact, :contact_name
    add_column :spaces, :contact_email, :string
    add_column :spaces, :contact_number, :string
    add_column :spaces, :content, :text
  end
end
