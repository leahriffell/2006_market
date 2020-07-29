require './lib/item'
require './lib/vendor'
require 'minitest/autorun'
require 'minitest/pride'

class VendorTest < MiniTest::Test 
  def setup 
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack") 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})    
  end 

  def test_it_exists_and_has_readable_attributes
    assert_instance_of Item, @item1 
    assert_equal "Tomato", @item2.name 
    assert_equal 0.5, @item2.price
    assert_instance_of Vendor, @vendor1 
    assert_equal "Rocky Mountain Fresh", @vendor1.name
  end

  def test_it_can_add_inventory_and_check_stock 
    assert_equal ({}), @vendor1.inventory 
    assert_equal 0, @vendor1.check_stock(@item1)
    
    @vendor1.stock(@item1, 30)
    assert_equal 30, @vendor1.check_stock(@item1)

    @vendor1.stock(@item1, 25)
    assert_equal 55, @vendor1.check_stock(@item1)

    @vendor1.stock(@item2, 12)
    assert_equal ({@item1 => 55, @item2 => 12}), @vendor1.inventory 
  end

  def test_it_can_calculate_potential_revenue 
    @vendor1.stock(@item1, 35)    
    @vendor1.stock(@item2, 7)   
    @vendor2.stock(@item4, 50)    
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65) 
    assert_equal 29.75, @vendor1.potential_revenue
    assert_equal 345.00, @vendor2.potential_revenue
    assert_equal 48.75, @vendor3.potential_revenue
  end
end 