require_relative 'node'
#Using iterative process
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
    #same code used in insert, needs to be turned into it's own method
    #example def iterator(method,position)
    count = 0
    current_node = @head
    if index == 0
      prepends(data)
    else
      #same logic used in pop, needs to be turned into its own method
      while count < index
        if count == (index -1)
          node.next = current_node.next
          current_node.next = node
        else
          current_node = current_node.next
        end
        count += 1
      end
    end
  end

  def includes?(data)
    conditional =[]
    current_node = @head
    while current_node.next != nil
      if current_node.data == data
        conditional << true
      else
        conditional << false
      end
      current_node = current_node.next
    end
    conditional.include?(true)
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
      position = self.count - 1
      if position == 0
        @head = nil
      else
        #same code used in insert, needs to be turned into it's own method
        #example def iterator(method,position)
        count = 0
        current_node = @head
        while count < position
          if count == (position -1)
            current_node.next = nil #insert Methods in if statement example Index(pop)
          else
            current_node = current_node.next
          end
          count += 1
        end
      end
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
    if index <= (self.count - 1)
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
    while counter < index
      if counter == (index - 1)
        current_node.next = current_node.next.next
        current_node.next.next = nil
      else
        current_node = current_node.next
        counter += 1
      end
    end
  end


end
