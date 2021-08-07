# frozen_string_literal: true

class FactorRing < Numeric
  FACTOR = 13

  def initialize(number)
    @value = Integer(number) % FACTOR
  end

  def to_s
    value.to_s
  end

  def inspect
    value.to_s
  end

  def +(other)
    self.class.new(value + other.value)
  end

  def *(other)
    self.class.new(value * other.value)
  end

  def -(other)
    self.class.new(value - other.value)
  end

  def /(other)
    self * other.inverse
  end

  def ==(other)
    value == other.value
  end

  def zero?
    value.zero?
  end

  def one?
    value == 1
  end

  protected

  attr_reader :value

  def inverse
    raise ZeroDevisionError if value.zero?

    1.upto(FACTOR - 1).map { |i| FactorRing.new(i) }.find do |i|
      (self * i).one?
    end
  end
end
