class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float  :price
      t.float  :cost

      t.timestamps
    end
  end
end
