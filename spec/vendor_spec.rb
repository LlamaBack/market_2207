require "./lib/vendor"

RSpec.describe Vendor do
  let(:vendor) {Vendor.new("Rocky Mountain Fresh")}
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: "$0.50"})}

  it 'exists and has readable attributes' do
    expect(vendor).to be_a(Vendor)
    expect(vendor.inventory).to eq({})
  end

  it 'can check_stock and stock items' do
    expect(vendor.stock(item1)).to eq(0)
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.stock(item1)).to eq(30)
  end
end
