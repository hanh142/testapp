json.array!(@commits) do |commit|
  json.extract! commit, :id, :sha1, :author, :date, :comment
  json.url commit_url(commit, format: :json)
end
