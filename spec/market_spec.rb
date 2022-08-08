require "./lib/market"

RSpec.describe do
  let(:market) {Market.new("South Pearl Street Farmers Market")}
  let(:vendor1) {Vendor.new("Rocky Mountain Fresh")}
  let(:vendor2) {Vendor.new("tomatoes")}
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: "$0.50"})}

  it "exists and has readable attributes" do
    expect(market).to be_a(Market)
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

  it "can add vendors and list them by item" do
    vendor1.stock(item1, 20)
    vendor1.stock(item2, 30)
    vendor2.stock(item2, 100)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)

    expect(market.vendors).to eq([vendor1,vendor2])
    expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "tomatoes"])
    expect(market.vendors_that_sell(item1)).to eq([vendor1])
    expect(market.vendors_that_sell(item2)).to eq([vendor1,vendor2])
  end

  it "can add vendors and list them by item" do
    vendor1.stock(item1, 20)
    vendor1.stock(item2, 30)
    vendor2.stock(item2, 100)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)

    expect(market.total_inventory).to eq( { item1 => {
                                              quantity: 20,
                                              vendors: [vendor1]
                                            },
                                            item2 => {
                                              quantity: 130,
                                              vendors: [vendor1, vendor2]
                                            }
                                          } )
  end

  it "can check for overstocked_items" do
    vendor1.stock(item1, 20)
    vendor1.stock(item2, 30)
    vendor2.stock(item2, 100)
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)

    expect(market.overstocked_items).to eq([item2])
  end

end
