require 'sinatra/base'
require './lib/peeps'


class Chitter < Sinatra::Base
  
  get '/' do
    @peeps = Peeps.history
    # @peeps.each {|peep| p peep}
    erb :index
  end

  post '/new_peep' do
    p params
    name = params[:name]
    peep = params[:peep]

    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (sender, peep, time) VALUES ('#{name}', '#{peep}', current_timestamp);")
    redirect '/'
  end

  run! if app_file == $0
end