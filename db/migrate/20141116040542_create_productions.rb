class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.date :when
      t.references :who, index: true
      t.references :what, index: true
      t.float :number

      t.timestamps
    end
  end
end
