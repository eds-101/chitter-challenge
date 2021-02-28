require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  
  before do
    # @counter = Counter.instance
    # p '@counter:', @counter
  end

  get '/' do
    @peeps = Peeps.feed
    erb :index
  end

  post '/new_peep' do
    p params
    username = params[:username]
    peep = params[:peep]
    Peeps.new(username: username, peep: peep)
    redirect '/'
  end

  run! if app_file == $0
end