# frozen_string_literal: true

class Hand
  def initialize(deck, field)
    @deck = deck
    @field = field
    @value = [deck.pop, deck.pop, deck.pop, deck.pop]
  end

  def action(index, position)
    if @field.action(@value[index], position)
      @value[index] = @deck.pop
      @value.compact!
      true
    else
      false
    end
  end

  def no_available_action(index, position)
    if @value.none? { |card| @field.valid_action?(card) }
      @field.no_available_action(@value[index], position)
      @value[index] = @deck.pop
      @value.compact!
      true
    else
      false
    end
  end

  def finished?
    @value.empty?
  end

  def [](index)
    @value[index]
  end

  def count
    @value.count
  end

  def to_s
    "手札 #{@value.join(' ')}"
  end
end
