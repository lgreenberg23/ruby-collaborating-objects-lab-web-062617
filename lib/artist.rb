
# The Artist class will be responsible for either creating the artist 
# (if the artist doesn't exist in our program yet) or finding the instance of 
# that artist (if the artist does exist).
require 'pry'

class Artist

	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end
 
	def self.find_or_create_by_name(name)
		artist = self.all.detect {|artist| artist.name == name}

			# binding.pry
			#this should return the specific artist object
		if artist == nil
			artist = self.new(name)	
			artist.save
		end
		artist
	end

	def add_song(song)
		#self.song = song
		self.songs << song
	end

	def print_songs
		@songs.each {|song| puts song.name}
	end

end







#   def artist_name=(name)
#     if (self.artist.nil?)
#       self.artist = Artist.new(name)
#     else
#       self.artist.name = name
#     end
#   end
# end