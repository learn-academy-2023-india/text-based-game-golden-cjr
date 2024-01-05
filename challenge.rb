# Text-based Game Challenge
def display_ascii
    File.readlines('zombie.txt') do |line|
        line
    end
end

puts display_ascii

puts 'Welcome to Z Survive'
puts 'Please enter your name'

player_name = gets.chomp.capitalize

# variable to show at starting point
bullets = 0
armor = 0
supplies = 0 # max 10 points
result = 0
lives = 5

puts "#{player_name}'s Equipment:"
puts "Lives: #{lives}, Ammo: #{bullets}, Armor: #{armor}, Food and Supplies: #{supplies}"



    if lives > 0
        puts "It's your turn to get food and supplies for your camp. They're depending on you now more than ever. Which area do you want to search first?"
        puts 'Type plaza, downtown, forrest, or return to camp'

        if supplies >= 10
                puts "You found all the food and supplies needed for your camp's survival! Return to camp!"
        end

    

        travel = gets.chomp.downcase

        while travel == "plaza"
            puts "Lives: #{lives}, Ammo: #{bullets}, Armor: #{armor}, Food and Supplies: #{supplies}"
            puts 'Where do you want to look?'
            puts 'Type grocery store, zalgreenz, clothing store'

            plaza_options = gets.chomp.downcase
                # p plaza_options
            if plaza_options == 'grocery store'
                puts 'You found food and supplies!'
                supplies += 3
                puts "Food and Supplies: #{supplies}"
            
            elsif plaza_options == "zalgreenz"
                puts 'While looking behind the counter, you hear the door open, when you look up, you see none other than a decayed, flesh eating, mindless husk of a former Zalgeens employee shambling towards you! Will you fight? Or will you run?'
                puts 'Type fight or run'

                def roll_dice
                        result = rand(1..6)
                        return result
                end

                fight_1 = gets.chomp.downcase
                
                if fight_1 == 'fight'
                    roll_dice
                    if result > 1
                        supplies += 1
                        puts "You felled the zombie and found supplies! Current Food and Supplies: #{supplies}"
                    
                    elsif result == 1
                            lives -= 1
                            puts "You lost a life! Current lives: #{lives}"
                    end
                    
                elsif fight_1 == 'run'
                    puts "You live to continue your search for food and supplies! Current lives: #{lives}"
                end
            
            elsif plaza_options == 'clothing store'
                puts 'As you open the door, a zombie Soccer Mom attacks you with her van load of adolescent zombie soccer players!'
                lives -= 5
                puts 'You lost ALL of your lives!'    
                game_start
            end
        end
    elsif lives == 0
        puts "You're dead. GAME OVER"
        game_start
    end