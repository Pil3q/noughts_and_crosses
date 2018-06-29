require 'sinatra/base'
require_relative './lib/game.rb'
require_relative './lib/player.rb'

class NoughtsAndCrosses < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end
end
