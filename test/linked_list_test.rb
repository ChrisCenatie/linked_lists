require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linked_list'
require '../lib/node'

class LinkedList < MiniTest::Test

  def setup
    #inclde sad paths, where there is the same data is in the list more than once
    @empty_list = List.new

    @one_item_list = List.new("Chris")

    @two_item_list = List.new("Chris")
    @two_item_list.append("Bob")

    @three_item_list = List.new("Chris")
    @three_item_list.append("Bob")
    @three_item_list.append("Timothy")
  end


  def test_list_initializes_with_a_nil_head
    list1 = List.new
    assert_equal nil, list1.head
  end

  def test_list_can_also_be_initialized_with_a_node
    data = "chris"
    list1 = List.new(data)
    assert_equal "chris", list1.head
  end

  def test_empty_list_appends_node_with_with
    list1 = List.new
    data = "Chris"
    list1.append(data)
    assert_equal data, list1.head
  end

  def test_list_appends_node_to_end_of_single_node_list
    list1 = List.new
    data1 = "Chris"
    list1.append(data1)
    data2 = "Jeff"
    list1.append(data2)
    assert_equal data2, list1.tail
  end

  def test_list_appends_node_to_end_of_multi_node_list
    list1 = List.new
    data1 = "Chris"
    data2 = "Jeff"
    data3 = "John"
    list1.append(data1)
    list1.append(data2)
    list1.append(data3)
    assert_equal data3, list1.tail
  end

  def test_single_node_is_prepended_to_beginning_of_list_with_no_nodes
    list1 = List.new
    data = "Chris"
    list1.prepends(data)
    assert_equal data, list1.head
  end

  def test_list_prepends_node_to_end_of_multi_node_list
    list1 = List.new
    data1 = "Chris"
    data2 = "Jeff"
    data3 = "John"
    list1.prepends(data1)
    list1.prepends(data2)
    list1.prepends(data3)
    assert_equal data3, list1.head
  end

  def test_it_finds_relative_index_of_head_node
    list = List.new
    list.append("Chris")
    assert_equal 0, list.find_by_value(list.head)
  end

  def test_it_finds_relative_index_of_node_after_head
    list = List.new
    data1 = "Chris"
    data2 = "Timothy"
    list.append(data1)
    list.append(data2)
    assert_equal 1, list.find_by_value(data2)
  end

  def test_it_finds_relative_index_of_third_node_after_head
    list = List.new
    data1 = "Chris"
    data2 = "Timothy"
    data3 = "Bobby"
    list.append(data1)
    list.append(data2)
    list.append(data3)
    assert_equal 2, list.find_by_value(data3)
  end

  def test_it_inserts_node_with_empty_list
    list = List.new
    data = "Chris"
    list.insert(data,0)
    assert_equal data, list.head
  end

  def test_it_inserts_node_at_head
    insert_node = "Timothy"
    @one_item_list.insert(insert_node,0)
    assert_equal insert_node, @one_item_list.head
  end

  def test_it_inserts_node_at_head_with_single_node_list
    insert_data = "Timothy"
    @one_item_list.insert(insert_data,0)
    assert_equal insert_data, @one_item_list.head
  end

  def test_it_inserts_data_in_middle_of_two_node_list
    insert_node = "Timothy"
    @two_item_list.insert(insert_node, 1)
    assert_equal 1, @two_item_list.find_by_value("Timothy")
  end

  def test_it_inserts_node_at_second_index_with_three_node_list
    @three_item_list.insert("Gary",2)
    assert_equal 0, @three_item_list.find_by_value("Chris")
    assert_equal 1, @three_item_list.find_by_value("Bob")
    assert_equal 2, @three_item_list.find_by_value("Gary")
    assert_equal 3, @three_item_list.find_by_value("Timothy")
  end

  def test_it_returns_false_if_element_is_not_included_in_list
    data = "Jeff"
    assert_equal false, @three_item_list.includes?(data)
  end

  def test_it_returns_true_if_element_is_not_included_in_list
    data = "Chris"
    assert_equal true, @three_item_list.includes?(data)
  end

  def test_it_finds_returns_the_tail_value
    assert_equal "Chris", @one_item_list.tail
    assert_equal "Bob", @two_item_list.tail
    assert_equal "Timothy", @three_item_list.tail
  end

  def test_pop_returns_nil_on_an_empty_list
    assert_equal nil, @empty_list.pop
  end

  def test_it_pops_the_last_nodes_from_the_list
    @one_item_list.pop
    @two_item_list.pop
    @three_item_list.pop
    assert_equal nil, @one_item_list.head
    assert_equal "Chris", @two_item_list.tail
    assert_equal "Bob", @three_item_list.tail
  end

  def test_count_returns_number_of_nodes_in_list
    assert_equal 0, @empty_list.count
    assert_equal 1, @one_item_list.count
    assert_equal 2, @two_item_list.count
    assert_equal 3, @three_item_list.count
  end

  def test_head_returns_nil_for_an_empty_list
    assert_equal nil, @empty_list.head
  end

  def test_head_returns_value_at_beginning_of_list
    assert_equal "Chris", @one_item_list.head
    assert_equal "Chris", @two_item_list.head
    assert_equal "Chris", @three_item_list.head
  end

  def test_it_returns_value_based_on_index
    assert_equal "Chris", @three_item_list.find_by_index(0)
    assert_equal "Bob", @three_item_list.find_by_index(1)
    assert_equal "Timothy", @three_item_list.find_by_index(2)
  end

  def test_it_returns_nil_when_index_in_list_does_not_exist
    assert_equal nil, @three_item_list.find_by_index(3)
  end

  def test_it_returns_nil_value_when_called_on_empty_list
    assert_equal nil, @empty_list.find_by_index(0)
    assert_equal nil, @empty_list.find_by_index(1)
  end

  def test_it_returns_the_index_of_the_first_occurence_of_the_value
    @three_item_list.append("Chris")
    assert_equal "Chris", @three_item_list.find_by_index(3)
    assert_equal 2, @three_item_list.find_by_value("Timothy")
    assert_equal 0, @three_item_list.find_by_value("Chris")
   end

  def test_find_by_value_returns_nil_if_value_does_not_exist
    assert_equal nil, @three_item_list.find_by_value("Jerry")
  end

  def test_find_by_value_returns_nil_on_empty_list
    assert_equal nil, @empty_list.find_by_value("Not Here")
  end

  def test_it_removes_node_given_an_index
    @three_item_list.remove_by_index(1)
    assert_equal "Timothy", @three_item_list.find_by_index(1)
    assert_equal nil, @three_item_list.find_by_value("Bob")
  end

  def test_it_removes_last_node_given_an_index
    @three_item_list.remove_by_index(2)
    assert_equal nil, @three_item_list.find_by_index(2)
    assert_equal nil, @three_item_list.find_by_value("Timothy")
  end

  def test_it_removes_first_node_given_an_index_of_zero
    @three_item_list.remove_by_index(0)
    assert_equal "Bob", @three_item_list.head
  end

  def test_it_does_not_remove_any_node_if_index_greater_than_count
    skip
    raise_equal NoMethodError,@three_item_list.remove_by_index(3)
  end

  def test_it_removes_node_containing_given_value
    @three_item_list.remove_by_value("Bob")
    assert_equal false, @three_item_list.includes?("Bob")
  end

  def test_it_removes_first_node_containing_data_given_data
    @three_item_list.append("Chris")
    @three_item_list.remove_by_value("Chris")
    assert_equal "Chris", @three_item_list.find_by_index(2)
    assert_equal "Bob", @three_item_list.head
  end
end
