require_relative "../src/day2_part2"

RSpec.describe InvalidProductKey do
  describe ".is_invalid_key" do
    it "returns true if number sequence is single digit" do
      expect(described_class.is_invalid_key(8)).to be_falsy 
    end

    context "positive cases" do
      it "returns true if the number sequence is one digit recurring" do
        [11, 33, 77, 99].each do |key|
          expect(described_class.is_invalid_key(key)).to be_truthy, "#{key} should be invalid" 
        end
      end
      it "returns true if the number sequence is two digit recurring" do
        [1111, 3232, 7373, 9191].each do |key|
          expect(described_class.is_invalid_key(key)).to be_truthy, "#{key} should be invalid" 
        end
      end
      it "returns true if the number sequence recurring" do
        [111111111, 323323323323, 73777377737773777377, 919123919123919123919123].each do |key|
          expect(described_class.is_invalid_key(key)).to be_truthy, "#{key} should be invalid" 
        end
      end
    end

    context "negative cases" do
      it "returns false if the number sequence is non-recurring double digit" do
        [12, 17, 19].each do |key|
          expect(described_class.is_invalid_key(key)).to be_falsy, "#{key} should be valid"
        end
      end
      it "returns false if the number sequence is non-recurring tripple digit" do
        [121, 173, 198].each do |key|
          expect(described_class.is_invalid_key(key)).to be_falsy, "#{key} should be valid"
        end
      end
      it "returns false if the number sequence is non-recurring" do
        [1211211234, 17331733173398, 19823198198198].each do |key|
          expect(described_class.is_invalid_key(key)).to be_falsy, "#{key} should be valid"
        end
      end
    end
  end
end
