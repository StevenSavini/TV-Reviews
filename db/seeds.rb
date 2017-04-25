response = HTTParty.get('http://api-public.guidebox.com/v2/shows?api_key=8b10c4c67aa4ed023d74d8510272f0fbed545f89&limit=250')
json_response = JSON.parse(response.body)
json_response["results"].each do |result|
  puts "Adding show to db..."
  id = result["id"]
  show_details = HTTParty.get("http://api-public.guidebox.com/v2/shows/#{id}\?api_key\=8b10c4c67aa4ed023d74d8510272f0fbed545f89")
  json_show_details = JSON.parse(show_details.body)
  Show.find_or_create_by!(title: result["title"]) do |show|
    show.image_url = result["artwork_448x252"]
    puts "Show added to db."
  end

  show = Show.find_by(title: result["title"])
  show.description = json_show_details["overview"]
  show.premiere_date = json_show_details["first_aired"]
  if show.save!
    puts "Show #{show.id} updated!"
  end
end
