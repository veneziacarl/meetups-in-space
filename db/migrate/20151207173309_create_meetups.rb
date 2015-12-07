class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.string :description, null: false
      table.string :location, null: false
      table.string :creator, null: false

      table.timestamps null: false
    end
  end
end

    # add_index :meetups, [:id, :name], unique: true

# class CreateAssembliesAndParts < ActiveRecord::Migration
#   def change
#     create_table :meetups_users do |t|
#       t.belongs_to :meetups, index: true
#       t.belongs_to :users, index: true
#     end
#   end
# end
