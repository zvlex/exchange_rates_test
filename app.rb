require 'sinatra'
require "json"

require 'nokogiri'
require 'rest-client'
require 'pry'

require './services/exchange_rates_parser'

get '/' do
  haml :index, :format => :html5
end

get '/exchange_rates' do
  content_type :json
  
  response = RestClient.get(params[:url])
  response = ExchangeRatesParser.send(params[:source], response)

  response.to_json
end
