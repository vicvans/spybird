require 'sinatra'
#TUTORIAL
require 'rubygems'
require 'oauth'
require 'json'
require 'tweetstream'
#require 'debugger'
require 'multi_json'
#Avoid conflict between tweetstream and sinatra
set :server, 'webrick'

TweetStream.configure do |config|
	config.consumer_key = 'ZgWljSLf5Ph7XdFZmNwHDpOc2'
	config.consumer_secret = 'aaHQquxOYUmpV5ZqUUMqZawPS0jjwRwUhLfHmU9ExdKuRc2NWR'
	config.oauth_token = '147727273-zi68INXwRiIx0uGG9CgbBQRzvcnyyJM8qn9enIpj'
	config.oauth_token_secret = 'CnWW3I8TMhbrYirqiFCtCrXh4ipmwMYppR3YYIJG6ibxj'
	config.auth_method = :oauth
end
# Probando
def render_tweet
	result=[];
	TweetStream::Client.new.track('like') do |status,client|
		result << status
		puts status
		client.stop if result.size>=1;
	end
	result[0].attrs.to_json
end

def render_tweet2
	this_h = {:nombre => "VictorVanegas", :alias => "V.V.", :love => "Kathy"}
	puts this_h
	this_j = this_h.to_json
end
#------------

get '/' do
  	"Hello world, it's #{Time.now} at the server!"
end

get '/managua' do
	# code = "<%=@statuses[0].text %>"
	erb :managua_tweets
end

get '/managua2' do
	#erb :managua_tweets2, :locals => {:par => params[:par]}
	erb :managua_tweets2
end

get '/stream.rb' do
	statuses =[]
	TweetStream::Client.new.track("like") do |status,client|
		statuses << status
		puts "#{status.text}"
		client.stop if statuses.size >=5
	end
	puts '------------------------------------------'
	puts statuses
	puts statuses.class
	puts statuses[0].class

end

get '/render_tweets.json' do
	content_type :json
	render_tweet
end


get '/managuad' do
	erb :managua_tweets_d
end



not_found do
	"Hey watt'cha doing here?"
end
