require 'nokogiri'
require 'open-uri'
require 'pry'

class TodaysEvents::Events
  attr_accessor :title, :location, :date

  
  def self.scrape
    events = []
    doc = Nokogiri::HTML(open('https://www.downtownhouston.org/calendar/'))
    # date = div.date->returns a list of all dates & times on page
    # title = h2-> returns a list of all titles
    # location = h3-> returns list of all
    # description = a href
    doc.css("div.item").each do |card|
      card.css("div.text").each do |event|
        location = event.css('h3').text
        title = event.css('h2.fav').text
        date = event.css('div.date').text.split("\n").uniq
        events << {title: title, location: location, date: date[1]}
      end
    end
    events
  end
  
end