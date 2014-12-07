class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :region
      t.string :location

      t.timestamps
    end
  end
end
