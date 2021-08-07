# frozen_string_literal: true

class Field
  def initialize(deck)
    @deck = deck
    @value = [deck.pop, deck.pop]
  end

  def action(card, position)
    if valid_action?(card)
      @value[position] = card
      true
    else
      false
    end
  end

  def no_available_action(card, position)
    @value[position] = card
  end

  def to_s
    "場 #{@value.join(' ')}"
  end

  def valid_action?(card)
    first, second = @value
    [
      first + second,
      first - second,
      second - first,
      first * second,
      (second.zero? ? nil : first / second),
      (first.zero? ? nil : second / first)
    ].any? do |i|
      i == card
    end
  end
end
