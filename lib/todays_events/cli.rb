
class Cli 
  def call
    generate_events
    welcome
    options
  end

  def generate_events
   Scraper.scrape
   #binding.pry
  end
  
  def welcome  
    puts "Here are some upcoming events happening in Houston:"
    puts ""
    puts ""
    Events.all.each.with_index(1) do |event, index|
      puts "#{index}. #{event.title}"
    end
  end

  def options
    @input = nil
    while @input != "exit"
      puts ""
      puts ""
      puts "Please enter the number of the event you would like more info on"
      puts "Or enter list to see the list again or exit to exit"

      @input = gets.strip.downcase
      
      if @input.to_i.between?(1, Events.all.count)
        all_info
      elsif @input.downcase == "list"
        welcome
      elsif @input.downcase == "exit"
        closing
      else
        puts ""
        puts ""
        puts "Sorry, that's an invalid input"
        puts ""
        puts ""
      end
    end
  end

  def all_info
    puts ""
    puts ""
    puts "Here is more info on that event:"
    event = Events.all[@input.to_i - 1]
    puts "#{event.title}"
    puts "This event is located at #{event.location} on #{event.date}"
    puts ""
    puts ""
  end

  def closing
    puts ""
    puts ""
    puts "See you next time!"
    puts ""
    puts ""
  end
end