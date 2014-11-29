class CreateProfits < ActiveRecord::Migration
  def change
    create_table :profits do |t|
      t.float :profit
      t.float :amount
      t.date :when

      t.timestamps
    end
  end
end
