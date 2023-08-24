# frozen_string_literal: true

class Calculator
  def add(*args)
    args.sum
  end

  def multiply(*args)
    args.reduce(:*)
  end

  def subtract(*args)
    args.reduce(:-)
  end

  def divide(*args)
    raise ArgumentError,"division by zero" if args.include?(0)
    args.reduce(:/)
  end
end
