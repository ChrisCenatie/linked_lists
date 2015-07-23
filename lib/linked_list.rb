require_relative 'node'

class List

  def initialize(data = nil)
    if data != nil
      @head = Node.new(data)
    else
      @head = data
    end
  end

  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = node
    end
  end

  def prepends(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      node.next = @head
      @head = node
    end
  end

  def find_by_value (data)
    counter = 0
    while find_by_index(counter) != data
      if find_by_index(counter) == nil
        return nil
      else
        counter += 1
      end
    end
    counter
  end

  def insert(data, index)
    node = Node.new(data)
    count = 0
    current_node = @head
    if index == 0
      prepends(data)
    else
      method_iterator("insert", index, node)
    end
  end

  def includes?(data,current_node = @head)
    if current_node.data == data
      return true
    elsif !(current_node.tail?)
      includes?(data,current_node.next)
    end
    false
  end

  def tail
    if @head == nil
      nil
    else
      current = @head
      until current.tail?
        current = current.next
      end
      current.data
    end
  end

  def pop
    if @head == nil
      @head = nil
    else
      position = count - 1
      if position == 0
        @head = nil
      else
        method_iterator("pop",position)
      end
    end
  end

  def method_iterator(method, index, node = nil)
    count = 0
    current_node = @head
    while count < index
      if count == (index -1)
        if method == "pop"
          current_node.next = nil
        else
          node.next = current_node.next
          current_node.next = node
        end
      else
        current_node = current_node.next
      end
      count += 1
    end
  end

  def count
    counter = 1
    current_node = @head
    if current_node == nil
      0
    else
      while current_node.next != nil
        current_node = current_node.next
        counter += 1
      end
      counter
    end
  end

  def head
    if @head == nil
      nil
    else
      @head.data
    end
  end

  def find_by_index(index)
    current_node = @head
    counter = 0
    if index <= (count - 1)
      while counter < index
        current_node = current_node.next
        counter += 1
      end
      current_node.data
    else
      nil
    end
  end

  def remove_by_index(index)
    current_node = @head
    counter = 0
    if (count - 1) == index
      pop
    elsif index == 0
      @head = current_node.next
      current_node.next = nil
    else
     count.times do
       if counter == (index - 1)
         current_node.next = current_node.next.next
         current_node.next.next = nil
       else
         current_node = current_node.next
       end
         counter += 1
     end
   end
  end

  def remove_by_value(data)
    index = find_by_value(data)
    remove_by_index(index)
  end

end
