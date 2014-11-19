class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :when
      t.references :who, index: true
      t.float :sum

      t.timestamps
    end
  end
end
