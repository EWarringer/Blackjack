#!/usr/bin/env ruby
require_relative "deck"
require_relative "hand"
require_relative "card"


SUITS = ["♠", "♥", "♦", "♣"]
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

deck = Deck.new

player = Hand.new(deck, "player")
dealer = Hand.new(deck, "dealer")

player.deal!
puts "\nPLAYER SCORE: #{player.total}"
player.choice

sleep(1)

dealer.deal!

until dealer.total > 16
  puts "Dealer hits"
  dealer.hit
end

if dealer.total > 21
  puts "DEALER BUST!"
else
  puts "\nDEALER SCORE: #{dealer.total}"
end


if (player.total > 21 || dealer.total > player.total) && dealer.total < 22
  sleep(0.5)
  puts "\nDealer Wins!"
elsif (dealer.total > 21 || player.total > dealer.total) && player.total < 22
  sleep(0.5)
  puts "\nPlayer Wins!"
else
  sleep(0.5)
  puts "\ndraw"
end
