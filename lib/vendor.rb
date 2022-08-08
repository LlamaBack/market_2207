class Vendor
  attr_reader :inventory, :name
  def initialize(name)
    @inventory = Hash.new(0)
    @name = name
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, qty)
    @inventory[item] += qty
  end
end
