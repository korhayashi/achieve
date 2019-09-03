class Player
  def hand
    puts "数字を入力してください。"
    puts "0:　グー"
    puts "1:　チョキ"
    puts "2:　パー"
    your_hand = gets.chomp
    your_hand
  end
end

class Enemy
  def hand
    return rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    enemy_h =
      if enemy_hand == 0
        "グー"
      elsif enemy_hand == 1
        "チョキ"
      else
        "パー"
      end

    enemy_result = "相手の手は#{enemy_h}です。"

    if player_hand == "0" || player_hand == "1" || player_hand == "2"
      player_hand = player_hand.to_i
      result = (player_hand - enemy_hand + 3) % 3
    end

    if player_hand.class == String
        puts "0〜2の数字を入力してください。"
        puts "0:　グー"
        puts "1:　チョキ"
        puts "2:　パー"
        your_hand = gets.chomp
        pon(your_hand, rand(0..2))
    elsif result == 2
        puts "#{enemy_result}あなたの勝ちです。"
    elsif result == 1
        puts "#{enemy_result}あなたの負けです。"
    elsif result == 0
        puts "#{enemy_result}あいこです。"
        puts "数字を入力してください。"
        puts "0:　グー"
        puts "1:　チョキ"
        puts "2:　パー"
        your_hand = gets.chomp
        pon(your_hand, rand(0..2))
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

janken.pon(player.hand, enemy.hand)
