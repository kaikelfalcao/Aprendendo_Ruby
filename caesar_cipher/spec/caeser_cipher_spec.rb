# frozen_string_literal: true

require '../caesar_cipher'

cipher = Cipher.new
describe Cipher do
  describe "#caesar_cipher" do
    it "testing the cipher string = \"Word\"" do
      expect(cipher.caesar_cipher("Word",5)).to eql("Btwi")
    end
  end
end