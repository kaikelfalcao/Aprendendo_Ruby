# frozen_string_literal: true

class Node
  include Comparable

  attr_accessor :data , :left , :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def to_s
    "Data: #{data}"
  end

  def <=> (other)
    data <=> other.data
  end
end
