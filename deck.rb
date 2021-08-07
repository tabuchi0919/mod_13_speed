# frozen_string_literal: true

class Deck
  def initialize
    @value = ([*1..7] * 1).shuffle.map { |i| FactorRing.new(i) }
  end

  def pop
    @value.pop
  end
end
