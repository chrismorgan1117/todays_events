
require 'pry'

class Events
  attr_accessor :title, :location, :date
  @@all = []
  def initialize(events_hash)
    events_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end
    
  def self.all
    @@all
  end

  def self.create_from_scrape(events_array)
    events_array.each do |events|
      Events.new(events)
    end
  end

  def self.list_event_titles
    @@all.each.with_index do |event, x|
      "#{x + 1}. #{event.title}"
    end
  end
end