
require 'pry'

class Events
  attr_accessor :title, :location, :date
  @@all = []
  def initialize(title, location, date)
    @@all << self
  end
    
  def self.all
    @@all
  end

  def self.list_event_titles
    @@all.each.with_index do |event, x|
      "#{x + 1}. #{event.title}"
    end
  end
end