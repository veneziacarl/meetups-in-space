class ChangeMeetupsColumnCreatorCreatorId < ActiveRecord::Migration
  def change
    rename_column :meetups, :creator, :creator_id
  end
end
