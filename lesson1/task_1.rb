require 'rspec/core'

class Human
  attr_reader :last_name
  attr_accessor :first_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def short_name
    "#{first_name} #{last_name}."
  end

  def initials
    "#{first_name[0]}#{last_name[0]}."
  end
end

class ArrayExtend < Array
  def sum
    result = 0
    if self.all? { |element| element.is_a? Integer }
      self.each { |element| result += element }
      result
    else
      "error, wrong array"
    end
  end

  def max
    result = self[0]
    if self.all? { |element| element.is_a? Integer}
      self.each do |element|
        if element > result
          result = element
        end
      end
      result
    else
      "error, wrong array"
  end
  end
end

RSpec.describe Human do
  let(:first_name) { 'Some thing' }
  let(:last_name)  { 'Some thing' }

  let(:instance) { described_class.new(first_name, last_name) }

  describe '#short_name' do
    subject { instance.short_name }
    it { expect(subject).to eq "#{first_name} #{last_name}." }
  end
end

RSpec.describe ArrayExtend do

  describe '#sum' do
    let(:instance) { described_class.new(array) }
    subject { instance.sum }

    context 'when array is [1,2,3,4]' do
      let(:array)    { [1,2,3,4] }

      it "It showing the sum of array" do
        expect(subject).to eq(10)
      end
    end
    context 'when array is [nil]' do
      let(:array)   { [nil] }

      it "It showing the sum of array" do
        expect(subject).to eq "error, wrong array"
      end
    end
    context 'when array is [1,2,something]' do
      let(:array)   { [1,2,'something'] }

      it "It showing the sum of array" do
        expect(subject).to eq "error, wrong array"
      end
    end
  end

  describe '#max' do
    subject {instance.max}
    let(:instance) { described_class.new(array) }

    context 'when array is [1,2,3,4]' do
      let(:array)    { [1,2,3,4] }

      it "It showing max number in array" do
        expect(subject).to eq(4)
      end
    end
    context 'when array is [1,2,something]' do
      let(:array)    { [1,-2,'something'] }

      it "It showing max number in array" do
        expect(subject).to eq "error, wrong array"
      end
    end
    context 'when array is [-1,-2,-500,4]' do
      let(:array)    { [-1,-2,-500,4] }

      it "It showing max number in array" do
        expect(subject).to eq(4)
      end
    end
  end
end
