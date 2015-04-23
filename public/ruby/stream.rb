statuses =[]
TweetStream::Client.new.track("like") do |status,client|
	statuses << status
	client.stop if @statuses.size >=15
end

puts '------------------------------------------'
puts statuses
puts statuses.class