namespace :get_comment do
 desc "gets commit comment from git"
 task :data => :environment do
 #ActiveRecord::Base.establish_connection("db/development")

  puts "gets commit comment from git"

  puts "Start...................................."

  dir1 = pwd
  dir2 = dir1 + "/spree"
  cd dir2
  puts dir2

  sh "git log --stat > ../lib/tasks/data.txt"

  cd dir1 + "/lib/tasks/"
  puts dir1
  line_num = 0
  require 'csv'
  comment_list = [] 
  comments = []
  commit_index = 0

  puts "Start to read data from text file"
  CSV.open("log_data.csv","wb") do |csv| 
	File.open("data.txt").each do |line|  
	   line_num = line_num + 1
	   beginning = line.length - line.lstrip.length 
   
	   if line.blank?
		puts "new line"
	   else     
	 	if line.split.first == "commit"
	 		# input previous comment		
			comment_list[commit_index] = comments
			# insert data to table git_comments
			GitComment.create!(
			index: comments[0] ,
			sha1: comments[1] ,
			merge: comments[2] ,
			author: comments[3] ,
			date: comments[4] ,
			comment: comments[5] ,
			file: comments[6] ,
			)
			csv << comment_list[commit_index]
			# new comment
			commit_index = commit_index + 1
			comments = ["","","","","","",""]		
	 		line.slice! "commit "
	    		sha1 = line
			comments[0] = commit_index
			comments[1] = sha1		
	    		puts "sha1  #{beginning} " + sha1
		elsif line.split.first == "Merge:"
			line.slice! "Merge: "
			merge = line
			comments[2] = merge
	    		puts "merge #{beginning} " + merge
		elsif line.split.first == "Author:"
			line.slice! "Author: "
			author = line
			comments[3] = author
	    		puts "author #{beginning} " + author
		elsif line.split.first == "Date:"
			line.slice! "Date: "
			date = line
			comments[4] = date
	    		puts "date #{beginning}" + date
		elsif beginning == 4
			line.slice! "    "
			comment = line
			comments[5] = comments[5] + ", \n" + comment
	    		puts "comment #{beginning}" + comment
	   	elsif beginning == 1 && line.include?("|")
			line.slice! "    "
			file = line
			comments[6] = comments[6] + ", \n" + file
	    		puts "file #{beginning}" + file
		else 
	    		puts "something else"
		end
	   end 
   	end 
  end
  puts "#{line_num} rows \n"
  puts "End to read data from text file"
  
 end
  puts "End...................................."
end
