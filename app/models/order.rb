class Order < ActiveRecord::Base
  has_many :orderdetails
end
