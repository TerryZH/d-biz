class Order < ActiveRecord::Base
  has_many :orderdetail
end
