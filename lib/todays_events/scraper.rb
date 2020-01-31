require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape
    events = []

    doc = Nokogiri::HTML(open('https://www.downtownhouston.org/calendar/'))

    doc.css("div.item").each do |card|
      card.css("div.text").each do |event|
        location = event.css('h3').text
        title = event.css('h2.fav').text
        date = event.css('div.date').text.split("\n").uniq
        events << {title: title, location: location, date: date[1]}
      end
    end

    #events.each do |event|
    #  Events.new(event)
    end
  end
end