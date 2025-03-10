require "./lib/vendor"

RSpec.describe Vendor do
  let(:vendor) {Vendor.new("Rocky Mountain Fresh")}
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: "$0.50"})}

  it 'exists and has readable attributes' do
    expect(vendor).to be_a(Vendor)
    expect(vendor.inventory).to eq({})
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'can check_stock and stock items' do
    expect(vendor.check_stock(item1)).to eq(0)
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.check_stock(item1)).to eq(30)
  end

  it 'can calculate potential revenue' do
    vendor.stock(item1, 35)
    vendor.stock(item2, 7)
    expect(vendor.potential_revenue).to eq(29.75)
  end
end
