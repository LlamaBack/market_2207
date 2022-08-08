require "date"
class Market
  attr_reader :name, :vendors, :total_inventory, :date
  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today.strftime("%d/%m/%Y")
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.key?(item)
    end
  end

  def total_inventory
    total = Hash.new {|h,k| h[k] = {quantity: 0, vendors: []}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, qty|
        total[item][:quantity] += qty
        total[item][:vendors] << vendor
      end
    end
    total
  end

  def overstocked_items
    total_inventory.keys.select do |item|
      total_inventory[item][:quantity] > 50 && total_inventory[item][:vendors].length > 1
    end
  end

  def sorted_item_list
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end

  def sell(item, qty)
    if total_inventory[item][:quantity] < qty
      return false
    end
    vendors.each do |vendor|
      if vendor.inventory[item] > qty
        vendor.inventory[item] -= qty
        return true
      else
        qty -= vendor.inventory[item]
        vendor.inventory[item] = 0
      end
    end
  end
end
