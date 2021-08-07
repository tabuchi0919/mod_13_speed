# frozen_string_literal: true

require './deck'
require './factor_ring'
require './field'
require './hand'

deck = Deck.new
field = Field.new(deck)
hand = Hand.new(deck, field)

loop do
  print "\e[2J\e[f"
  puts field
  puts hand
  puts
  index = nil
  position = nil
  action_type = nil
  loop do
    puts '出せるカードがある？[y/n]'
    action_type = gets.chomp
    break if %w[y n].include?(action_type)

    puts '無効な入力です'
  end

  case action_type
  when 'y'
    loop do
      max_index = hand.count - 1
      puts "手札の何枚目を出す？[0-#{max_index}]"
      index = gets.chomp
      break if (0..max_index).map(&:to_s).include?(index)

      puts '無効な入力です'
    end

    loop do
      puts '場の何枚目に出す？[0-1]'
      position = gets.chomp
      break if %w[0 1].include?(position)

      puts '無効な入力です'
    end

    unless hand.action(index.to_i, position.to_i)
      puts '出せません(Enterで次へ)'
      gets
    end
  when 'n'
    loop do
      max_index = hand.count - 1
      puts "手札の何枚目を出す？[0-#{max_index}]"
      index = gets.chomp
      break if (0..max_index).map(&:to_s).include?(index)

      puts '無効な入力です'
    end

    loop do
      puts '場の何枚目に出す？[0-1]'
      position = gets.chomp
      break if %w[0 1].include?(position)

      puts '無効な入力です'
    end

    unless hand.no_available_action(index.to_i, position.to_i)
      puts '出せるカードが存在します(Enterで次へ)'
      gets
    end
  end

  if hand.finished?
    puts 'クリア'
    break
  end
end
