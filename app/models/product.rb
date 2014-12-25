class Product < ActiveRecord::Base
    def self.get_storages
        magic_num = 100
        storages = Array.new
        Product.all.each do |p|
            made = Production.where("what_id = ?", p.id).sum("number").round(2)
            sold = Item.where("product_id = ?", p.id).sum("number").round(2)
            storages.insert -1, {
                :product_id => p.id,
                :made => made,
                :sold => sold,
                :prio => made==sold ? nil : (sold/(sold+magic_num)/(made-sold)*2500).round,
            }
        end
        return storages
    end
end
