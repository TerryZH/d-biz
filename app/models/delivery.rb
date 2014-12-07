class Delivery < ActiveRecord::Base
  belongs_to :who
  belongs_to :bill_to
  belongs_to :deliver_to
end
