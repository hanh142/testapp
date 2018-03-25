class Search < ActiveRecord::Base
  def search_commits
    results = Commit.all
    results = results.where(["author LIKE ?", "%#{author}%"]) if author.present?
    results = results.where(["date LIKE ?", "%#{date}%"]) if date.present?
    results = results.where(["comment LIKE ?", "%#{comment}%"]) if comment.present?
   # puts "results #{results}"

    return results
  end
end
