class Product < ActiveRecord::Base
    def self.get_storages
        magic_num = 100
        storages = Array.new
        Product.all.each do |p|
            made = Production.where("what_id = ?", p.id).sum("number")
            sold = Item.where("product_id = ?", p.id).sum("number")
            storages.insert -1, {
                :product => p.name,
                :made => made.round(2),
                :sold => sold.round(2),
                :left => (made-sold).round(2),
                :prio => made==sold ? nil : (sold/(sold+magic_num)/(made-sold)*2500).round,
            }
        end
        return storages
    end
end
