class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :order, index: true
      t.references :delivery, index: true
      t.references :product, index: true
      t.float :number
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
