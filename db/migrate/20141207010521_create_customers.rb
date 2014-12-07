class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.date :when_joined
      t.string :nick
      t.string :tel
      t.string :email
      t.string :wechat
      t.string :weibo

      t.timestamps
    end
  end
end
