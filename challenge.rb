# Text-based Game Challenge
def display_ascii
    File.readlines('zombie.txt') do |line|
        line
    end
end
def display_box
    File.readlines('supply.txt') do |line|
        line
    end
end

def youdieded
    File.readlines('gameover.txt') do |line|
        line
    end
end

def display_title
    File.readlines('title.txt') do |line|
        line
    end
end

puts display_ascii
puts display_title

def game_start 
    puts 'Welcome to Z Survive'
    puts 'Please enter your name'
    
end
game_start
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
                puts display_box
                puts 'You found food and supplies!'
                supplies += 3
                puts "Food and Supplies: #{supplies}"
            
            elsif plaza_options == "zalgreenz"
                puts 'While looking behind the counter, you hear the door open, when you look up, you see none other than a decayed, flesh eating, mindless husk of a former Zalgeens employee shambling towards you! Will you fight? Or will you run?'
                puts 'Type fight or run'

                
                fight_1 = gets.chomp.downcase
                
                if fight_1 == 'fight'
                    puts 'How do you want to attack? Hook left or right?' 
                    puts 'Type left or right'
                    
                    hook_1 = gets.chomp.downcase
                        
                    if hook_1 == 'right'
                        supplies += 1
                        puts "You felled the zombie and found supplies! Current Food and Supplies: #{supplies}"
                    
                    elsif hook_1 == 'left'
                            lives -= 1
                            puts "You lost a life, but got away! Current lives: #{lives}"
                    end
                    
                elsif fight_1 == 'run'
                    puts "You live to continue your search for food and supplies! Current lives: #{lives}"
                end
            
            elsif plaza_options == 'clothing store'
                puts 'As you open the door, a zombie Soccer Mom attacks you with her van load of adolescent zombie soccer players!'
                lives -= 5
                puts 'You lost ALL of your lives!' 
                puts youdieded
                   
                
            end
        end
    elsif lives <= 0
        puts "You're dead. GAME OVER you are dieded"
       
    end
