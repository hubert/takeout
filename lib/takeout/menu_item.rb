module Takeout
  class MenuItem
    attr_reader :price, :items

    def initialize(price: 0.0, items: [])
      @price = price
      @items = items
    end

    def eql?(other)
      price.eql?(other.price) &&
      items.sort.eql?(other.items.sort)
    end

    def contains_part_of?(item_list)
      !(item_list & items).empty?
    end

    def <=>(other)
      object_id <=> other.object_id
    end
  end
end
