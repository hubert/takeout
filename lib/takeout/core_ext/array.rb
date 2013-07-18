if !Array.instance_methods.include?(:remove_once)
  class Array
    def remove_once(items_for_removal)
      items_for_removal.each do |item|
        item_index = index(item)
        delete_at(item_index) if item_index
      end
      self
    end
  end
end
