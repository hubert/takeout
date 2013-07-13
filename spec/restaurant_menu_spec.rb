require 'castlight'

module Castlight
  describe RestaurantMenu do
    describe '#best_price' do
      it 'finds the lowest price for a single item' do
        item = MenuItem.new(price: 10.0, items: ['toro'])
        combo = MenuItem.new(price: 9.0, items: ['toro', 'chu toro'])
        menu = RestaurantMenu.new(id: 1, menu_items: [item, combo])
        expect(menu.best_price(['toro'])).to eql(9.0)
      end

      it 'finds the lowest price for multiple items' do
        item1 = MenuItem.new(price: 10.0, items: ['toro'])
        item2 = MenuItem.new(price: 10.0, items: ['chu toro'])
        combo = MenuItem.new(price: 19.0, items: ['toro', 'chu toro'])
        menu = RestaurantMenu.new(id: 1, menu_items: [item1, item2, combo])
        expect(menu.best_price(['toro', 'chu toro'])).to eql(19.0)
      end

      it 'finds the lowest price for multiple items when items duplicated on menu' do
        item1 = MenuItem.new(price: 10.0, items: ['toro'])
        item2 = MenuItem.new(price: 11.0, items: ['chu toro'])
        item3 = MenuItem.new(price: 10.0, items: ['chu toro'])
        menu = RestaurantMenu.new(id: 1, menu_items: [item1, item2, item3])
        expect(menu.best_price(['toro', 'chu toro'])).to eql(20.0)
      end

      it 'chooses the lowest price even if there are extra items' do
        item1 = MenuItem.new(price: 10.0, items: ['toro'])
        item2 = MenuItem.new(price: 10.0, items: ['chu toro'])
        combo = MenuItem.new(price: 19.0, items: ['toro', 'chu toro', 'maguro'])
        menu = RestaurantMenu.new(id: 1, menu_items: [item1, item2, combo])
        expect(menu.best_price(['toro', 'chu toro'])).to eql(19.0)
      end

      it 'returns nil if all items cannot be found on menu' do
        item1 = MenuItem.new(price: 10.0, items: ['toro'])
        item2 = MenuItem.new(price: 10.0, items: ['chu toro'])
        combo = MenuItem.new(price: 19.0, items: ['toro', 'chu toro', 'maguro'])
        menu = RestaurantMenu.new(id: 1, menu_items: [item1, item2, combo])
        expect(menu.best_price(['toro', 'tako'])).to be_nil
      end

      it 'handles case of using multiple combo items' do
        item1 = MenuItem.new(price: 10.0, items: ['toro'])
        item2 = MenuItem.new(price: 10.0, items: ['chu toro'])
        combo1 = MenuItem.new(price: 19.0, items: ['toro', 'chu toro', 'maguro'])
        combo2 = MenuItem.new(price: 29.0, items: ['unagi', 'chu toro', 'hotate'])
        combo3 = MenuItem.new(price: 39.0, items: ['unagi', 'hotate', 'awabi'])
        menu = RestaurantMenu.new(id: 1, menu_items: [item1, item2, combo1, combo2, combo3])
        expect(menu.best_price(['toro', 'maguro', 'unagi', 'hotate'])).to eql(48.0)
      end
    end
  end
end
