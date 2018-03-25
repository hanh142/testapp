class Modfile < ActiveRecord::Base
 belongs_to :commit

 def self.search(search)
	if search
		joins("INNER JOIN commits ON commits.sha1 = modfiles.sha1").select("modfiles.sha1,commits.author,commits.comment,commits.date").where(["file LIKE ?","%#{search}%"])
	end
 end
end
