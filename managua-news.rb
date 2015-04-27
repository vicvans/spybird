require 'sinatra'
require 'rubygems'
require 'oauth'
require 'json'
require 'tweetstream'
#Avoid conflict between tweetstream and sinatra
set :server, 'webrick'
#js read sinatra parameters(vars)
require 'gon-sinatra'

Sinatra::register Gon::Sinatra

TweetStream.configure do |config|
	config.consumer_key = 'ZgWljSLf5Ph7XdFZmNwHDpOc2'
	config.consumer_secret = 'aaHQquxOYUmpV5ZqUUMqZawPS0jjwRwUhLfHmU9ExdKuRc2NWR'
	config.oauth_token = '147727273-zi68INXwRiIx0uGG9CgbBQRzvcnyyJM8qn9enIpj'
	config.oauth_token_secret = 'CnWW3I8TMhbrYirqiFCtCrXh4ipmwMYppR3YYIJG6ibxj'
	config.auth_method = :oauth
end
# Extract and convert tweet from api to json
def render_tweet(term)
	result=[];
	TweetStream::Client.new.track(term) do |status,client|
		result << status
		client.stop if result.size>=1;
	end
	result[0].attrs.to_json
end

get '/' do
  	erb :index
end

#Main functionality open streaming with the desired term
get '/track' do
#	Store term to read from JS to stream
	@this_var = params['term']
	gon.this_var = @this_var
	erb :managua_tweets2, :locals => {:term => params['term']}
end

get '/testo' do
	@this_var = params['term']
	puts "---------------------"
	puts @this_var
	puts @this_var.class
	@this_var.nil?
end


#AJAX Call to json extraction
get '/render_tweets.json/:term' do
	content_type :json
	render_tweet(params[:term])
end

not_found do
	"Hey watt'cha doing here?"
end

get '/secret/nyawnya' do
	erb :secureto
end
#------------------------------------------------------
# Not working ways----------------------
#Standar way
get '/managua' do
	# code = "<%=@statuses[0].text %>"
	erb :managua_tweets
end
#Daemonazing
get '/managuad' do
	erb :managua_tweets_d
end
#----------------------
#Stream
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
#---------------------------------
#Test of jsoon
def render_tweet2
	this_h = {:nombre => "VictorVanegas", :alias => "V.V.", :love => "Kathy"}
	puts this_h
	this_j = this_h.to_json
end
#------------

