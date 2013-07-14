require 'takeout'

module Takeout
  describe MenuImporter do
    describe '#import' do
      it 'returns a collection of RestaurantMenu objects' do
        menu1 = RestaurantMenu.new(id: '1', menu_items: [MenuItem.new(price: 20.0, items: ['misuji']), MenuItem.new(price: 7.0, items: ['fernet_branca'])])
        menu2 = RestaurantMenu.new(id: '2', menu_items: [MenuItem.new(price: 22.0, items: ['zabuton']), MenuItem.new(price: 8.0, items: ['fernet_branca'])])
        restaurant_menus = MenuImporter.import('spec/fixtures/test_menu.csv').sort_by(&:id)
        expect(restaurant_menus.first).to eql(menu1)
        expect(restaurant_menus.last).to eql(menu2)
      end

      it 'handles multiple menu items' do
        menu = RestaurantMenu.new(id: '1', menu_items: [MenuItem.new(price: 7.0, items: ['fernet_branca', 'ginger_ale'])])
        restaurant_menus = MenuImporter.import('spec/fixtures/multiple_menu_items.csv')
        expect(restaurant_menus.first).to eql(menu)
      end

      it 'undescores items with spaces' do
        menu = RestaurantMenu.new(id: '1', menu_items: [MenuItem.new(price: 7.0, items: ['fernet_branca', 'ginger_ale'])])
        restaurant_menus = MenuImporter.import('spec/fixtures/menu_items_with_spaces.csv')
        expect(restaurant_menus.first).to eql(menu)
      end
    end
  end
end
