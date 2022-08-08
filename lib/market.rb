class Market
  attr_reader :name, :vendors, :total_inventory
  def initialize(name)
    @name = name
    @vendors = []
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

  
end
