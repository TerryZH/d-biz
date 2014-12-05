class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.date :when
      t.string :what
      t.float :sum
      t.float :number

      t.timestamps
    end
  end
end
