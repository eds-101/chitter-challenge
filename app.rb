require 'sinatra/base'
require './lib/peeps copy'

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
    @name = params[:name]
    @peep = params[:peep]
    new_peep = [@name, @peep]
    @peeps << new_peep
    redirect '/'
  end

  run! if app_file == $0
end