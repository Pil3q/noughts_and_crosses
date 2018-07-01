require 'sinatra/base'
require_relative './lib/game.rb'
require_relative './lib/player.rb'

class NoughtsAndCrosses < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
      session[:game] = Game.new(Player.new('X', params[:player_1_name]), Player.new('O', params[:player_2_name]))
      redirect '/game'
  end

  get '/game' do
    @game = session[:game]
    erb(:game)
  end
end
