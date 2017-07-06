# The Song class will be responsible for creating songs given
#  each filename and sending the artist's name (a string) to the Artist class
 require 'pry'

class Song

	attr_accessor :name, :artist
	# attr_reader :artist

	#@@song_array = []

	def initialize(name)
		@name = name
	end

	# def self.artist=(artist)
	# 	self.artist = artist
	# end

	def self.new_by_filename(file_name)
		song_array = file_name.split(" - ")
		
		song = self.new(song_array[1])
		#song.name = song_array[1]
		
		artist = Artist.find_or_create_by_name(song_array[0])
		artist.add_song(song)

		song.artist = artist
		
		 # binding.pry
		song
	end

end


		# song_array 
		# artist_name = song_array[0]
		# array_part_2 = song_array[1].split(".")
		# name = array_part_2[0]
		# format = array_part_2[1]
		# self.create_by_name(name, artist_name)