# frozen_string_literal: true

require_relative 'binary_tree'

tree = Tree.new((Array.new(15) { rand(1..100) }))

puts "Balanced: "
puts tree.balanced?

tree.pretty_print

puts "Pre Order: "
puts tree.preorder
puts "In Order: "
puts tree.inorder
puts "Post Order: "
puts tree.postorder

tree.insert(1001)
tree.insert(1005)
tree.insert(1003)
tree.insert(1002)
tree.insert(1004)
tree.insert(1009)

tree.pretty_print

puts "Balanced: "
puts tree.balanced?

puts "Rebalance: "
puts tree.rebalance

puts "Balanced Again: "
puts tree.balanced?

puts "Pre Order: "
puts tree.preorder
puts "In Order: "
puts tree.inorder
puts "Post Order: "
puts tree.postorder

tree.pretty_print


