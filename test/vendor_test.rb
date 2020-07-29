require './lib/item'
require './lib/vendor'
require 'minitest/autorun'
require 'minitest/pride'

class VendorTest < MiniTest::Test 
  def setup 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end 

  def test_it_exists 
    assert_intance_of Item, @item1 
    assert_intance_of Vendor, @vendor 
  end
end 