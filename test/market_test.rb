require './lib/item'
require './lib/vendor'
require './lib/market'
require 'minitest/autorun'
require 'minitest/pride'

class MarketTest < MiniTest::Test 
  def setup 
    @market = Market.new("South Pearl Street Farmers Market")    
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")    
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end 

  def test_it_exists_and_has_readable_attributes 
    assert_instance_of Market, @market
    assert_equal "South Pearl Street Farmers Market", @market.name
  end
end 