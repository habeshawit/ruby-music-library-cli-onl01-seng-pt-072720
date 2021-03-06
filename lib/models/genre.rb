require_relative '../../lib/concerns/findable.rb'

class Genre 
  extend Concerns::Findable
  attr_accessor :name, :song, :artist, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
  def self.create(genre_name) 
    genre = self.new(genre_name) 
    genre.save
    genre
  end
  
  def songs 
    @songs
  end
  
  def artists
    @songs.map{|song| song.artist}.uniq
  end
  
end