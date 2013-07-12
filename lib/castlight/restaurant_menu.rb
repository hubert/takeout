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
  end
end
