require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node'

class NodeTest < MiniTest::Test

  def test_node_holds_different_types_of_data
    name = "Chris"
    node1 = Node.new(name)
    students = ["Chris", 28]
    node2 = Node.new(students)
    assert_equal "Chris", node1.data
    assert_equal ["Chris", 28], node2.data
  end

  def test_node_is_instantiated_with_no_next
    name = "Chris"
    node = Node.new(name)
    assert_equal nil, node.next
  end

  def test_node_links_with_another_node
    name = "Chris"
    node1 = Node.new(name)
    name2 = "Seth"
    node2 = Node.new(name)
    node1.next = node2
    assert_equal node2, node1.next
  end

  def test_existing_node_links_can_be_deleted
    name = "Chris"
    node1 = Node.new(name)
    name2 = "Seth"
    node2 = Node.new(name)
    node1.next = node2
    assert_equal node2, node1.next
    node1.next = nil
    assert_equal nil, node1.next
  end

  def test_node_knows_it_is_tail
    name = "Chris"
    node1 = Node.new(name)
    assert node1.tail?
  end

end
