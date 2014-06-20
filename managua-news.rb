require 'sinatra'
#TUTORIAL
require 'rubygems'
require 'oauth'
require 'json'
require 'tweetstream'
#Avoid conflict between tweetstream and sinatra
set :server, 'webrick'

TweetStream.configure do |config|
	config.consumer_key = 'ZgWljSLf5Ph7XdFZmNwHDpOc2'
	config.consumer_secret = 'aaHQquxOYUmpV5ZqUUMqZawPS0jjwRwUhLfHmU9ExdKuRc2NWR'
	config.oauth_token = '147727273-zi68INXwRiIx0uGG9CgbBQRzvcnyyJM8qn9enIpj'
	config.oauth_token_secret = 'CnWW3I8TMhbrYirqiFCtCrXh4ipmwMYppR3YYIJG6ibxj'
	config.auth_method = :oauth
end



get '/' do
  	"Hello world, it's #{Time.now} at the server!"
end

get '/managua' do
	# code = "<%=@statuses[0].text %>"
	erb :managua_tweets
end

get '/managua2/:par' do
	erb :managua_tweets2, :locals => {:par => params[:par]}
end

get '/managua3' do 
	erb :managua_tweets3
end

get '/managua_d' do
	track start
end


get '/cosa' do
	@cosa="lala"
	erb :cosa
end

not_found do
	"Hey watt'cha doing here?"
end
