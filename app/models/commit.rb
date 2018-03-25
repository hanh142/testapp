class Commit < ActiveRecord::Base
 has_many :modfile, :foreign_key => 'sha1', :primary_key =>'sha1'
 # Search by comments
 def self.search_c(search)
	if search
		joins("INNER JOIN modfiles ON commits.sha1 = modfiles.sha1").select("commits.sha1,commits.author,commits.comment,commits.date,count(modfiles.file) AS file").where(["comment LIKE ?","%#{search}%"]).group("sha1","commits.author","commits.comment","commits.date")
	end
 end

# Search by auhor
def self.search_a(search)
	if search
		joins("INNER JOIN modfiles ON commits.sha1 = modfiles.sha1").select("commits.author,modfiles.file,count(commits.sha1) AS t").where(["author LIKE ?","%#{search}%"]).group("commits.author","modfiles.file")
	end
 end

end
