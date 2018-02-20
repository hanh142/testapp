namespace :get_comment do
 desc "gets commit comment from git"
 task :data => :environment do
  puts "gets commit comment from git"
  dir1 = pwd
  dir2 = pwd + "/spree"
  cd dir2
  sh "git log --stat --pretty=format:'%h,%an,%ad,%s,'> ../lib/tasks/file.csv"
  sh "git log --name--only --stat --pretty=format:'%h,%an,%ad,%s'> ../lib/tasks/file.txt"
  sh "git log --stat > ../lib/tasks/file1.csv"
  
  puts dir1
  puts dir2
 end 
end
