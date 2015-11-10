json.array!(@polls) do |poll|
  json.extract! poll, :id, :categoryid, :gender-dependency, :explicit, :question, :flag
  json.url poll_url(poll, format: :json)
end
