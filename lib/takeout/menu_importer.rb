require 'csv'

module Takeout
  class MenuImporter
    class << self
      def import(filename)
        menu_items_by_restaurant = CSV.read(filename).group_by { |item| item.shift }
        menu_items_by_restaurant.map do |restaurant_id, menu_items|
          RestaurantMenu.new(id: restaurant_id, menu_items: parse_items(menu_items))
        end
      end
      
      def parse_items(line_items_array)
        line_items_array.map do |line_item|
          MenuItem.new(price: line_item.shift.to_f, items: line_item)
        end
      end
    end
  end
end
