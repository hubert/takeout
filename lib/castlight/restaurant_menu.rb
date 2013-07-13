module Castlight
  class RestaurantMenu
    attr_reader :id, :menu_items

    def initialize(id: nil, menu_items: [])
      @id = id
      @menu_items = menu_items
    end

    def eql?(other)
      id.eql?(other.id) &&
      menu_items.sort.eql?(other.menu_items.sort)
    end

    def best_price(order_list, items_on_menu=menu_items)
      return if items_on_menu.empty?
      prices = []
      items_on_menu.each_with_index do |menu_item, index|
        if menu_item.contains_part_of?(order_list)
          remaining_items = order_list - menu_item.items
          prices << if remaining_items.empty?
            p "done, price is #{menu_item.price}"
            menu_item.price
          else
            p "looking for best price of #{remaining_items} in #{items_on_menu.slice(index + 1, items_on_menu.length - 1).map(&:items)}"
            remaining_best_price = best_price(remaining_items, items_on_menu.slice(index + 1, items_on_menu.length - 1))
            menu_item.price + remaining_best_price if remaining_best_price
          end
        end
      end    
      prices.compact.min
    end
  end
end
