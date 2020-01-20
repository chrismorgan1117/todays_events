class TodaysEvents::Cli 
  def call
    welcome
    options
    closing
  end
  
  def welcome    
    @events = TodaysEvents::Events.scrape
    puts "Here are some upcoming events happening in Houston:"
    @events.each.with_index(1) do |event, x|
      puts "#{x}. #{event[:title]}"
    end
  end

  def options
    @input = nil
    while @input != "exit"
      puts "Please enter the number of the event you would like more info on"
      puts "Or enter list to see the list again or exit to exit"
      @input = gets.strip.downcase
      
     
      if @input.to_i > 0
        all_info
      elsif @input == "list"
        welcome
      else
        puts "Sorry, that's an invalid input"
      end
    end
  end

  def all_info
    puts ""
    puts ""
    puts "Here is more info on that event:"
    event = @events[@input.to_i - 1]
    puts "#{event[:title]}"
    puts "This event is located at #{event[:location]} on #{event[:date]}"
    puts ""
    puts ""
  end

  def closing
    puts "See you next time!"
  end
end