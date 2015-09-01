class Hand
  attr_accessor :score, :hand, :user

  def initialize(deck, user)
    @score = 0
    @hand = []
    @deck = deck
    @user = user
  end

  def deal!
    @hand << @deck.draw!
    @hand << @deck.draw!
    puts "#{@user} was dealt #{@hand.first.card} and #{@hand.last.card}."
  end

  def hit
    @hand << @deck.draw!
    puts "#{@user} was dealt #{@hand.last.card}."
  end

  def stand
    puts "#{@user} stands."
  end

  def choice
    while total < 21
      print "\nHit or stand (H/S):"
      input = gets.chomp

      if input.downcase == 'h'
        hit
      elsif input.downcase == 's'
        stand
        break
      else
        puts "speak english!"
      end
      if total > 21
        sleep(0.5)
        puts "\nBUST!\n\n"
      else
        sleep(0.5)
        puts "\nPLAYER SCORE: #{total}"
      end
    end
  end

  def total
    @score = 0
    @hand.each do |card|
      if ["J", "Q", "K"].include?(card.rank)
        @score += 10
      elsif card.rank == "A"
        if @score > 10
          @score += 1
        else
          @score += 11
        end
      else
        @score += card.rank
      end
    end
    @score
  end
end
