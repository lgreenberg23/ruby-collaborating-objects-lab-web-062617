require 'pry'

class MP3Importer
	attr_accessor :path

	def initialize(filepath)
		@path = filepath
		@files = []
	end


	def files
		#loads into path directory
		#normalizes filenames to take out path
		@files = Dir.entries(self.path).compact
		i = 0
		while i< @files.length
			@files.delete_if {|file| !file.include?(" - ")}
			i += 1
		end
		@files
	end

	def import
		#imports files into Artist.all by creating songs from a filename
		#call this function in a loop where you can call it for a string of just one file name
		self.files.collect do |file|
			Song.new_by_filename(file)
		end
		#put song into artist.class @@all
		# binding.pry
	end

end




=begin
Let's start with the MP3 Importer. Build an MP3Importer class that parses a 
directory of files and sends the filenames to a song class to create a library 
of music with artists that are unique. use two methods:MP3Importer#files and 
MP3Importer#import. 

Your MP3Importer class should also have a path attribute that gets set on 
 initialization.

You should write code that responds to MP3Importer.new('./db/mp3s').import. 
Google around for how to get a list of files in a directory! Make sure you 
only get .mp3 files.

Since we have to send the filenames to the Song class, we'll end up 
calling the following code in the #import method: Song.new_by_filename(some_filename). 
This will send us to the Song class, specifically Song.new_by_filename.
=end

#MP3Importer.new('./db/mp3s').import

# Dir["/path/to/search/**/*.mp3"]