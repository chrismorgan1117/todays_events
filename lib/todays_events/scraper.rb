class Scraper

  def self.scrape
    #events = []

    doc = Nokogiri::HTML(open('https://www.downtownhouston.org/calendar/'))

    doc.css("div.item").each do |card|
      card.css("div.text").each do |event|
        location = event.css('h3').text
        title = event.css('h2.fav').text
        date = event.css('div.date').text.split("\n").map {|e| e.strip}.select{|e| e != ""}.select.with_index {|e, i| i != 1}.join(", ").gsub("&dash; ", "")
        #date = event.date.map {|e| e.strip}.select{|e| e != ""}.select.with_index {|e, i| i != 1}.join(", ").gsub("&dash; ", "")
        #events << {title: title, location: location, date: date[1]}
        Events.new(title, location, date)
      end
      
    end
    # event.date.map {|e| e.strip}.select{|e| e != ""}.select.with_index {|e, i| i != 1}.join(", ").gsub("&dash; ", "")
    #events.each do |event|
    #  Events.new(event)
    #end
  end
end