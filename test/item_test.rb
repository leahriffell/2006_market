require './lib/item'
require 'minitest/autorun'
require 'minitest/pride'

class ItemTest < MiniTest::Test 
  def setup 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
  end 

  def test_it_exists_and_has_readable_attributes 
    assert_instance_of Item, @item1 
    assert_equal "Peach", @item1.name 
    assert_equal 0.75, @item1.price 
  end
end