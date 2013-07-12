require 'rspec'
require 'castlight'

describe Castlight::MenuImporter do
  context 'given a file name' do
    it 'returns a collection of RestaurantMenu objects' do
      menu1 = Castlight::RestaurantMenu.new(id: '1', menu_items: [Castlight::MenuItem.new(price: 20.0, items: ['misuji']), Castlight::MenuItem.new(price: 7.0, items: ['fernet branca'])])
      menu2 = Castlight::RestaurantMenu.new(id: '2', menu_items: [Castlight::MenuItem.new(price: 22.0, items: ['zabuton']), Castlight::MenuItem.new(price: 8.0, items: ['fernet branca'])])
      restaurant_menus = Castlight::MenuImporter.import('spec/fixtures/test_menu.csv')
      expect(restaurant_menus.first).to eql(menu1)
      expect(restaurant_menus.last). to eql(menu2)
    end
  end
end
