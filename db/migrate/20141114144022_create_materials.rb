class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.date :when
      t.string :what
      t.float :sum
      t.float :price

      t.timestamps
    end
  end
end
