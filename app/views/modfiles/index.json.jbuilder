json.array!(@modfiles) do |modfile|
  json.extract! modfile, :id, :modfile, :sha1, :file
  json.url modfile_url(modfile, format: :json)
end
