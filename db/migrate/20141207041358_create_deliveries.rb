class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :who, index: true
      t.datetime :start
      t.datetime :milestone0
      t.datetime :milestone1
      t.datetime :milestone2
      t.datetime :milestone3
      t.datetime :milestone4
      t.datetime :milestone5
      t.datetime :milestone6
      t.datetime :milestone7
      t.datetime :milestone8
      t.datetime :milestone9
      t.datetime :end
      t.references :bill_to, index: true
      t.references :ship_to, index: true

      t.timestamps
    end
  end
end
