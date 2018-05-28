# => A ruby program to alert about new listings from CarGurus and tweet to the user
# => Author: Fadini
# => 5/28/2018

require 'uri'
require 'net/http'
require 'json'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "CONSUMER_KEY"
  config.consumer_secret     = "CONSUMER_SECRET"
  config.access_token        = "ACCESS_TOKEN"
  config.access_token_secret = "ACCESS_SECRET"
end



uri = URI 'https://www.cargurus.com/Cars/inventorylisting/ajaxFetchSubsetInventoryListing.action?sourceContext=untrackedExternal_true_0'
req = Net::HTTP::Post.new(uri)

req['origin']        = 'https://www.cargurus.com' 
req['cache-control'] = 'no-cache'                
req['pragma']        = 'no-cache'  

i = 1

# => Forester 2004-2008

while i == 1

  puts "Forester"

  #Filters
  req.set_form_data(
  "page"=>"1", "zip"=>"32114", "address"=>"", "latitude"=>"", "longitude"=>"",
  "distance"=>"100", "selectedEntity"=>"c3463", "transmission"=>"",
  "entitySelectingHelper.selectedEntity2"=>"c8308", "minPrice"=>"", "maxPrice"=>"",
  "minMileage"=>"", "maxMileage"=>"", "bodyTypeGroup"=>"", "serviceProvider"=>"",
  "filterBySourcesString"=>"", "filterFeaturedBySourcesString"=>"",
  "displayFeaturedListings"=>"true", "searchSeoPageType"=>"",
  "inventorySearchWidgetType"=>"AUTO", "allYearsForTrimName"=>"false",
  "daysOnMarketMin"=>"", "daysOnMarketMax"=>"", "vehicleDamageCategoriesRaw"=>"",
  "minCo2Emission"=>"", "maxCo2Emission"=>"", "vatOnly"=>"false",
  "minEngineDisplacement"=>"", "maxEngineDisplacement"=>"", "minMpg"=>"",
  "maxMpg"=>"", "minEnginePower"=>"", "maxEnginePower"=>"", "isRecentSearchView"=>"false"
  )


  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request req }
  #puts res.code # => "200"

  json = JSON.parse res.body

  currentListed = json['listings'].size  

  puts currentListed


  lastedUpdated = File.read("forester.txt").to_i

  if currentListed < lastedUpdated
    tweetString = "The amount of listings have decreased."
  else
    tweetString = "The amount of listings have increased."
  end    


  if currentListed != lastedUpdated
    File.open("forester.txt", "w") do |line|
      line.puts currentListed
    end
    client.update("The listings have changed for Subaru Forester around 32114

    Years: 2004-2008

    #{tweetString}

    Previously listed: #{lastedUpdated}
    Currently listed: #{currentListed}

    @<your twitter handle>")
  else
  end

  i = 2
end








# => WRX 
while i == 2

  puts "WRX"

  #Filters
  req.set_form_data(
    "page"=>"1", "zip"=>"32114", "address"=>"", "latitude"=>"", "longitude"=>"",
    "distance"=>"100", "selectedEntity"=>"d2233", "transmission"=>"ANY",
    "entitySelectingHelper.selectedEntity2"=>"", "minPrice"=>"", "maxPrice"=>"",
    "minMileage"=>"", "maxMileage"=>"", "bodyTypeGroup"=>"", "serviceProvider"=>"",
    "filterBySourcesString"=>"", "filterFeaturedBySourcesString"=>"",
    "displayFeaturedListings"=>"true", "searchSeoPageType"=>"",
    "inventorySearchWidgetType"=>"AUTO", "allYearsForTrimName"=>"false",
    "daysOnMarketMin"=>"", "daysOnMarketMax"=>"", "vehicleDamageCategoriesRaw"=>"",
    "minCo2Emission"=>"", "maxCo2Emission"=>"", "vatOnly"=>"false",
    "minEngineDisplacement"=>"", "maxEngineDisplacement"=>"", "minMpg"=>"",
    "maxMpg"=>"", "minEnginePower"=>"", "maxEnginePower"=>"", "isRecentSearchView"=>"false"
  )


  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request req }
  #puts res.code # => "200"

  json = JSON.parse res.body

  currentListed = json['listings'].size  

  puts currentListed


  lastedUpdated = File.read("wrx.txt").to_i

  if currentListed < lastedUpdated
    tweetString = "The amount of listings have decreased."
  else
    tweetString = "The amount of listings have increased."
  end


  if currentListed != lastedUpdated
    File.open("wrx.txt", "w") do |line|
      line.puts currentListed
    end
    client.update("The listings have changed for a Subaru Impreza WRX around 32114

       #{tweetString}

      Previously listed: #{lastedUpdated}
      Currently listed: #{currentListed}


      @<your twitter handle>")
  else
  end

  i = 3
end



# => MAZDASPEED 3
while i == 3

  puts "MAZDASPEED 3"

  #Filters
  req.set_form_data(
    "page"=>"1", "zip"=>"32114", "address"=>"", "latitude"=>"", "longitude"=>"",
    "distance"=>"100", "selectedEntity"=>"d941", "transmission"=>"",
    "entitySelectingHelper.selectedEntity2"=>"", "minPrice"=>"", "maxPrice"=>"",
    "minMileage"=>"", "maxMileage"=>"", "bodyTypeGroup"=>"", "serviceProvider"=>"",
    "filterBySourcesString"=>"", "filterFeaturedBySourcesString"=>"",
    "displayFeaturedListings"=>"true", "searchSeoPageType"=>"",
    "inventorySearchWidgetType"=>"AUTO", "allYearsForTrimName"=>"false",
    "daysOnMarketMin"=>"", "daysOnMarketMax"=>"", "vehicleDamageCategoriesRaw"=>"",
    "minCo2Emission"=>"", "maxCo2Emission"=>"", "vatOnly"=>"false",
    "minEngineDisplacement"=>"", "maxEngineDisplacement"=>"", "minMpg"=>"",
    "maxMpg"=>"", "minEnginePower"=>"", "maxEnginePower"=>"", "isRecentSearchView"=>"false"
  )


  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request req }
  #puts res.code # => "200"

  json = JSON.parse res.body

  currentListed = json['listings'].size  

  puts currentListed


  lastedUpdated = File.read("ms3.txt").to_i

  if currentListed < lastedUpdated
    tweetString = "The amount of listings have decreased."
  else
    tweetString = "The amount of listings have increased."
  end


  if currentListed != lastedUpdated
    File.open("ms3.txt", "w") do |line|
      line.puts currentListed
    end
    client.update("The listings have changed for a MAZDASPEED 3 around 32114
      

      #{tweetString}

      Previously listed: #{lastedUpdated}
      Currently listed: #{currentListed}


      @<your twitter handle>")
  else
  end

  i = 4
end




# => MAZDASPEED 6
while i == 4


  puts "MAZDASPEED 6"

  #Filters
  req.set_form_data(
    "page"=>"1", "zip"=>"32114", "address"=>"", "latitude"=>"", "longitude"=>"",
    "distance"=>"100", "selectedEntity"=>"d841", "transmission"=>"ANY",
    "entitySelectingHelper.selectedEntity2"=>"", "minPrice"=>"", "maxPrice"=>"",
    "minMileage"=>"", "maxMileage"=>"", "bodyTypeGroup"=>"", "serviceProvider"=>"",
    "filterBySourcesString"=>"", "filterFeaturedBySourcesString"=>"",
    "displayFeaturedListings"=>"true", "searchSeoPageType"=>"",
    "inventorySearchWidgetType"=>"AUTO", "allYearsForTrimName"=>"false",
    "daysOnMarketMin"=>"", "daysOnMarketMax"=>"", "vehicleDamageCategoriesRaw"=>"",
    "minCo2Emission"=>"", "maxCo2Emission"=>"", "vatOnly"=>"false",
    "minEngineDisplacement"=>"", "maxEngineDisplacement"=>"", "minMpg"=>"",
    "maxMpg"=>"", "minEnginePower"=>"", "maxEnginePower"=>"", "isRecentSearchView"=>"false"
  )


  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request req }
  #puts res.code # => "200"

  json = JSON.parse res.body

  currentListed = json['listings'].size   

  puts currentListed 

  lastedUpdated = File.read("ms6.txt").to_i

  if currentListed < lastedUpdated
    tweetString = "The amount of listings have decreased."
  else
    tweetString = "The amount of listings have increased."
  end


  if currentListed != lastedUpdated
    File.open("ms6.txt", "w") do |line|
      line.puts currentListed
    end
    client.update("The listings have changed for a MAZDASPEED 6 around 32114

       #{tweetString}

      Previously listed: #{lastedUpdated}
      Currently listed: #{currentListed}


      @<your twitter handle>")
  else
  end

  i = 5
end
