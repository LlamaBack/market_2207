class Vendor
  attr_reader :inventory
  def initialize(name)
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, qty)
    @inventory[item] += qty
  end
end
