require 'bundler/setup'
require 'takeout'

class TakeoutApp < Thor
  desc 'order FILENAME, *ITEMS', 'find restaurant and cheapest price for items'
  def order(filename, *items)
    restaurant_menus = ::Takeout::MenuImporter.import(filename)
    best_prices = restaurant_menus.map do |restaurant_menu|
      best_price = restaurant_menu.best_price(items)
      best_price ? { id: restaurant_menu.id, price: best_price } : nil
    end
    if lowest_price = best_prices.compact.min_by { |best_price| best_price[:price] }
      p "Restaurant #{lowest_price[:id]} has your order for #{lowest_price[:price]}"
    else
      p "No restaurant can fulfill your order"
    end
  end

  desc 'version', 'show current version'
  def version
    p ::Takeout::VERSION
  end
end
