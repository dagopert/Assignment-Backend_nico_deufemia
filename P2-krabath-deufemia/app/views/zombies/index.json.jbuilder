json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :Name, :Graveyard, :Day_Of_Death, :No_Of_Arms, :Description
  json.url zombie_url(zombie, format: :json)
end
