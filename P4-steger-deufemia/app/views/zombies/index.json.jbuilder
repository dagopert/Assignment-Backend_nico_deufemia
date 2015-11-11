json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :Name, :Graveyard, :Day_of_death, :No_of_arms, :Description
  json.url zombie_url(zombie, format: :json)
end
