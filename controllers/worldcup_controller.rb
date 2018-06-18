class WorldCupController < Sinatra::Base

  # sets root as the parent-directory of the current file
set :root, File.join(File.dirname(__FILE__), '..')

# sets the view directory correctly
set :views, Proc.new { File.join(root, "views") }

configure :development do
  register Sinatra::Reloader
end


    #Index
    get '/worldcup' do

      @title = "World Cup History"

      @worldcup = WorldCup.all

      erb :'worldcup/index'

    end

    #New
    get '/worldcup/new' do

      @worldcup = WorldCup.new

      erb :'worldcup/new'

    end

    #Show
    get '/worldcup/:id' do


      id = params[:id].to_i            #changing contents of array into integer


      @worldcup = WorldCup.find id     #able to select single record by id

      erb :'worldcup/show'

    end

    #Create
    post '/worldcup/' do

        worldcup = WorldCup.new

        worldcup.host = params[:host]
        worldcup.year = params[:year]
        worldcup.winner = params[:winner]

        worldcup.save

        redirect '/'


    end

    #Update
    put '/worldcup/:id'  do

      id = params[:id].to_i

      # Find the right post from our DB using .find
      worldcup = WorldCup.find id

      worldcup.host = params[:host]
      worldcup.year = params[:year]
      worldcup.winner = params[:winner]

      worldcup.save

      redirect '/worldcup'


    end

    delete '/worldcup/:id'  do

      id = params[:id].to_i

      WorldCup.destroy id

      redirect '/worldcup'

    end

    get '/worldcup/:id/edit'  do

      id = params[:id].to_i

      @worldcup = WorldCup.find id

      erb :'worldcup/edit'

    end


end
