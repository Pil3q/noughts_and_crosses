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
      redirect '/player'
  end

  get '/player' do
    @game = session[:game]
    erb(:player)
  end

  post '/player2' do
    @game = session[:game]
    @game.player_swap
    redirect '/game'
  end
  get '/game' do
    @game = session[:game]
    erb(:game)
  end

  post '/move' do
    @game = session[:game]
    @game.move(params[:field].to_i)
    redirect '/game'
  end
end
