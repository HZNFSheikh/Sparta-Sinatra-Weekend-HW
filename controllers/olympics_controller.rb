class OlympicsController < Sinatra::Base

  # sets root as the parent-directory of the current file
set :root, File.join(File.dirname(__FILE__), '..')

# sets the view directory correctly
set :views, Proc.new { File.join(root, "views") }

configure :development do
  register Sinatra::Reloader
end


    #Index
    get '/olympics' do

      @title2 = "Olympic Games History"

      @olympics = Olympics.all

      erb :'olympics/index'

    end

    #New
    get '/olympics/new' do

      @olympics = Olympics.new

      erb :'olympics/new'

    end

    #Show
    get '/olympics/:id' do


      id = params[:id].to_i            #changing contents of array into integer


      @olympics = Olympics.find id     #able to select single record by id

      erb :'olympics/show'

    end

    #Create
    post '/olympics/' do

        olympic = Olympics.new

        olympic.host_city = params[:host_city]
        olympic.olympic_year = params[:olympic_year]

        olympic.save

        redirect '/olympics'


    end

    #Update
    put '/olympics/:id'  do

      id = params[:id].to_i

      # Find the right post from our DB using .find
      olympic = Olympics.find id

      olympic.host_city = params[:host_city]
      olympic.olympic_year = params[:olympic_year]

      olympic.save

      redirect '/olympics'


    end

    delete '/olympics/:id'  do

      id = params[:id].to_i

      Olympics.destroy id

      redirect '/olympics'

    end

    get '/olympics/:id/edit'  do

      id = params[:id].to_i

      @olympics = Olympics.find id

      erb :'olympics/edit'

    end



end
