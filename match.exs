#***************************************************************************#
#FILE: match.exs 															#
#																			#
# DESCRIPTION: This program is a drop-in replacement for the grep command.  #														#
# 																			#	
# DEVELOPER: Jacqueline S. Homan										    #
# DEVELOPER PHONE: +1(814)384-1469 											#	
# DEVELOPER EMAIL: jacquelinehoman7@gmail.com 								#	
# 																			#	
# VERSION: 1.0.0															#
# CREATED DATETIME: 20180408-19:00 EST/EDT Time Zone USA					#
# 																			#
# VERSION: 1.0.1															#
# REVISION DATETIME: YYMMDD-HH:MM											#
# DEVELOPER MAKING CHANGE: First_name Last_name								#
# DEVELOPER MAKING CHANGE: PHONE: +1 (XXX) XXX-XXXX							#
# DEVELOPER MAKING CHANGE: EMAIL: example.com 								#
# 																			#
# Copyright (C) 2018. Codecatenation, LLC - All Rights Reserved.			#
# Unauthorized copying of this file, via any medium, is strictly prohibited.#
# Proprietary and confidential. 											#
#																			#
#***************************************************************************#
# First we need to establish that the file exists and 
# can be read
defmodule Match do
	def read_file(file) do 
		if File.exists?(file) do 
			File.read!(file) |> IO.inspect
		else
			File.error("Could not read file 'testfile.csv': No such file or directory")
		end 
	end


end
# Here we call read_file on a sample csv file
file = "test.csv"
Match.read_file(file)

# Here, we implement the logic for taking user input
# of a string which we will match against
# in the file, and ouput the results 
# should any matching terms exist.

defmodule Search do 
	def match(file, query) do
		File.stream!(file)
		|> Stream.map(&String.trim/1)
		|> Stream.map(fn ({line}) -> 
			if String.contains?(query) do
				IO.puts("#{line} #{query}")
			end
			
		end)
		|> Stream.run 
	end

end


