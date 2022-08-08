class Item
  attr_reader :name, :price
  def initialize(stock_info)
    @name = stock_info[:name]
    @price = stock_info[:price][1..-1].to_f
  end
  
end
