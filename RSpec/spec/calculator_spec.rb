
require '../lib/calculator'

calculator = Calculator.new
describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      expect(calculator.add(5,2)).to eql(7)
    end
    it "returns the sum of more than two numbers" do
      expect(calculator.add(2,5,7)).to eql(14)
    end
  end
  describe "#multiply" do
    it "returns the product of two numbers" do
      expect(calculator.multiply(2,7)).to eql(14)
    end
    it "returns 0 when multiplying by 0"do
      expect(calculator.multiply(0,1)).to eql(0)
    end
  end

  describe "#subtract" do
    it "returns the negative difference of two numbers" do
      expect(calculator.subtract(2,7)).to eql(-5)
    end
    it "returns the positive difference of two numbers" do
      expect(calculator.subtract(5,3)).to eql(2)
    end
  end

  describe "#divide" do
    it "returns the quotient of two numbers" do
      expect(calculator.divide(10,5)).to eql(2)
    end
    it "raises an ArgumentError when dividing by zero" do
      expect { calculator.divide(3, 0) }.to raise_error(ArgumentError,"division by zero")
    end
  end
end

