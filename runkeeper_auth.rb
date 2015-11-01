require "rubygems"
require "health_graph"

def color str, num
  "\e[#{num}m#{str}\e[0m"
end

HealthGraph.configure do |config|
  print color("Client ID: ", 33)
  config.client_id = gets
  print color("Client Secret: ", 33)
  config.client_secret = gets
  config.authorization_redirect_url = "http://jimaoka.github.io/runkeeper-auth"
end

auth_url = HealthGraph.authorize_url

system("open", auth_url)

print color("Auth Code: ", 34)
auth_code = gets

access_token = HealthGraph.access_token(auth_code)

puts color("Token: ", 32) + access_token
