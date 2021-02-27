require 'sinatra/base'
require './lib/peeps'


class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peeps.history
  end

  run! if app_file == $0
end