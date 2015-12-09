class ChangeMeetupsColumnCreatorIdStringInteger < ActiveRecord::Migration
  def change
    remove_column :meetups, :creator_id
    add_column :meetups, :creator_id, :integer, null: false
  end
end
