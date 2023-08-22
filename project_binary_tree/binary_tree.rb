require_relative 'Node'

class Tree

  attr_accessor :root, :data

  def initialize(arr)
    @data = arr.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2

    root = Node.new(arr[mid])

    root.left = build_tree(arr[0...mid])

    root.right = build_tree(arr[mid+1..-1])

    root
  end

  def insert(value)
    new_node = Node.new(value)
    if root.nil?
      @root = new_node
      return
    end
    current = root

    while current
      if new_node.data < current.data
        if current.left.nil?
          current.left = new_node
          return
        end
        current = current.left
      else
        if current.right.nil?
          current.right = new_node
          return
        end
        current = current.right
      end
    end
  end

  def delete(value)
    parent = nil
    current = root

    while current
      if value < current.data
        parent, current = current, current.left
      elsif value > current.data
        parent, current = current, current.right
      else
        if current.left.nil?
          root = parent.nil? ? current.right : (parent.left == current ? parent.left = current.right : parent.right = current.right)
        elsif current.right.nil?
          root = parent.nil? ? current.left : (parent.left == current ? parent.left = current.left : parent.right = current.left)
        else
          min_parent, min_node = current, current.right
          min_parent, min_node = min_node, min_node.left while min_node.left
          current.data = min_node.data
          min_parent.left == min_node ? min_parent.left = min_node.right : min_parent.right = min_node.right
        end
        break
      end
    end
  end

  def level_order(node = root, queue = [])
    print "#{node.data} "
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    return if queue.empty?

    level_order(queue.shift, queue)
  end

  def preorder(node = root)
    # Root Left Right
    return if node.nil?

    print "#{node.data} "
    preorder(node.left)
    preorder(node.right)
  end

  def inorder(node = root)
    # Left Root Right
    return if node.nil?

    inorder(node.left)
    print "#{node.data} "
    inorder(node.right)
  end

  def postorder(node = root)
    # Left Right Root
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print "#{node.data} "
  end

  def height(node = root)
    return -1 if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)

    1 + [left_height, right_height].max
  end

  def depth(node)
    depth = 0
    current = root
    while current
      if node.data < current.data
        current = current.left
      elsif node.data > current.data
        current = current.right
      else
        return depth
      end

      depth +=1
    end
  end

  def find(value)
    current = root
    while current
      return nil if current.nil?
      if value < current.data
        current = current.left
      elsif value > current.data
        current = current.right
      else
        return current
      end
    end
  end

  def balanced?
    result = height(root.left) - height(root.right)
    result.abs > 1 ? false : true
  end
  def inorder_array(node = root, array = [])
    unless node.nil?
      inorder_array(node.left, array)
      array << node.data
      inorder_array(node.right, array)
    end
    array
  end
  def rebalance
    self.data = inorder_array
    self.root = build_tree(data)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end






