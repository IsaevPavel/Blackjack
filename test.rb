require './lib/player'

puts "Welcome to game BlackJack!\n\n"
puts "If you want to start game press Enter"
gets.chomp

players=Player.new("Player 1"), Player.new("Player 2")
players.each do |player|
  until player.over?
    puts "#{player.name} you the card is"
    p player.roll
    player.add_points(player.element)
    puts "Press 'e' to enough"
    player.choice(gets.chomp)
  end
  puts "\nTotal score #{player.total_points}\n\n"
end
players.each do |player|
  puts "Total score #{player.name} is #{player.total_points}"
end
if players[0].total_points<=21 && players[1].total_points<=21
  real_winner=players.max_by{|player| player.total_points}
  puts "\nCongratulation #{real_winner.name} you win!"
elsif players[0].total_points>21 && players[1].total_points<=21
  puts "\nCongratulation #{players[1].name} you win!"
elsif players[0].total_points<=21 && players[1].total_points>21
  puts "\nCongratulation #{players[0].name} you win!"
elsif players[0].total_points<=21 && players[1].total_points<=21 && players[0].total_points==players[1].total_points
 puts "Draw"
else
 puts "Draw"
end



