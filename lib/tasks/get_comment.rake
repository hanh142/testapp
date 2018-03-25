namespace :get_comment do
 desc "gets commit comment from git"
 task :data => :environment do
 #ActiveRecord::Base.establish_connection("db/development")

  puts "gets commit comment from git"
  puts "Start...................................."

  # Open folder
  dir1 = pwd
  dir2 = dir1 + "/spree"
  cd dir2
  puts dir2

  # save log data to data.txt
  sh "git log --stat > ../lib/tasks/data.txt"

  cd dir1 + "/lib/tasks/"
  

  puts dir1
  line_num = 0 
  data = [] 
  commits = ["index","sha1","merge","author","date","comments","files"]
  commits_list = []
  data_cm = []
  commits_data = ["sha1","author","date","comments"]
  data_fl = []
  files_list = [] 
  files_data = ["sha1","files"]
  data_fl[0] = ["sha1","files"]
  commit_index = 0
  file_rowid = 0
  file_sha1 = ""

  puts "Start to read data from text file"
  File.open("data.txt").each do |line|  
	   line_num = line_num + 1
	   beginning = line.length - line.lstrip.length 
   
	   if line.blank?
		# puts "new line"
                line.sub!("/^\n/","")
	   else     
	 	if line.split.first == "commit"
	 		# push previous data row to list		
			data[commit_index] = commits
			data_cm[commit_index] = commits_data
			
			# create new data row
			commit_index = commit_index + 1
			# reset data
			commits = ["","","","","","",""]
			commits_data = ["","","",""]		
			# get sha1
	 		line.slice! "commit "
	    		sha1 = line.strip
			# log_data
			commits[0] = commit_index
			commits[1] = sha1
			# commits
			commits_data[0] = sha1
			file_sha1 = sha1	
	    		# puts "sha1  #{beginning} " + sha1
		elsif line.split.first == "Merge:"
			line.slice! "Merge: "
			merge = line.strip
			# log_data
			commits[2] = merge
	    		# puts "merge #{beginning} " + merge
		elsif line.split.first == "Author:"
			line.slice! "Author: "
			author = line.strip
			# log_data
			commits[3] = author
			# commits
			commits_data[1] = author
	    		# puts "author #{beginning} " + author
		elsif line.split.first == "Date:"
			line.slice! "Date: "
			date = line.strip
			# log_data
			commits[4] = date
			# commits
			commits_data[2] = date
	    		# puts "date #{beginning}" + date
		elsif beginning == 4
			comment = line.strip
			if commits_data[3].blank?
				commits_data[3] = comment
			else	
				# log_data
				commits[5] = commits[5] + " \n" + comment
				# commits
				commits_data[3] = commits_data[3] + " \n" + comment
			end
	    		 # puts "comment #{beginning}" + comment
	   	elsif beginning == 1 && line.include?("|")	
			file = line.strip
			file = file[0,line.index("|")-2]
		      	# files
			file_rowid += 1
			files_data[0] = file_sha1
			files_data[1] = file
			data_fl[file_rowid] = files_data
			files_data = ["",""]			
	    		# puts "#{file_rowid} files_data #{data_fl[file_rowid]}" + file
		 else 
	    		 #puts "else  + #{line}"
		 end
	    end 
  end 
  puts "End to read data from text file"
  
  # write to log_data.csv
  puts "write to log_data.csv"
  rowid = 0;
  require 'csv'
  CSV.open("log_data.csv","wb") do |csv| 
  	data.each do |row|     	
		csv << data[rowid]	
                rowid += 1		
	end	
  end
puts "write to log_data.csv _ end"

 require 'csv'
 # write to commit.csv
 puts "write to commit.csv"
 rowid = 0;
  CSV.open("commit.csv","wb") do |commits_csv| 
	data_cm.each do |row|	
		commits_csv << data_cm[rowid]  
		rowid += 1   
	end	
  end
puts "write to commit.csv _ end "

 # write to modifile.csv
 puts "write to modifile.csv"
 a = data_fl.length
 require 'csv'
 rowid = 0;
  CSV.open("modifile.csv","wb") do |files_csv| 
	data_fl.each do |row|
		files_csv << data_fl[rowid]
		rowid += 1	
	end
  end

puts "write to modifile.csv _ end "
  

 require 'csv'

 # insert to commit table
 puts "Start to insert to commit table"
  csv_text = File.read("commit.csv")
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
	Commit.create!(
	sha1: row[0],
	author: row[1],
	date: row[2],
	comment: row[3]
	)
  end 
puts "End to insert to commit table"

# insert to Modfile table
 puts "Start to insert to Modfile table"
  csv_text = File.read("modifile.csv")
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
	Modfile.create!(
	 sha1: row[0],
	 file: row[1]
	)
  end 
puts "End to insert to Modfile table"


  puts "End...................................."
 end
  
end



