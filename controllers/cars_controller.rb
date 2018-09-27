class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # Setting the root as the parent directory of the current dircetory.
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  $cars = [
    {
      :id => 1,
      :make => 'Ferrari',
      :model => '250 SWB',
      :engine => 'V12'
    },
    {
      :id => 2,
      :make => 'Jaguar',
      :model => 'E-Type',
      :engine => 'Straight 6'
    },
    {
      :id => 3,
      :make => 'Lamborghini',
      :model => 'Miura',
      :engine => 'V12'
    }
  ]

  # Index
  get '/cars' do
    @title = "Index Page"
    @cars = $cars
    erb :'cars/index'
  end

  # New
  get '/cars/new' do
    erb :'cars/new'
  end

  # SHOW
  get '/cars/:id' do
    id = params[:id].to_i
    @car =$cars[id- 1]

    erb :'cars/show'
  end

  # CREATE
  post '/cars' do

    id = $cars.length + 1

  newCar = {
    :id => id,
    :make => params[:make],
    :model => params[:model],
    :engine => params[:engine]
  }
  $cars.push newCar

    redirect '/cars'

    puts $cars

  end

  # Update
  put '/cars/:id' do
    id = params[:id].to_i-1

    car = $cars[id]

    car[:make] = params[:make]
    car[:model] = params[:model]
    car[:engine] = params[:engine]

    $cars[id] = car

    redirect '/cars'

  end

  # Delete
  delete '/cars/:id' do
    id = params[:id].to_i
    $cars.delete_at id
    redirect '/cars'
  end

  # Edit
  get '/cars/:id/edit' do
    id = params[:id].to_i
    @car =$cars[id- 1]
    erb :'cars/edit'
  end

  post '/cars' do
    "CREATE cars"
  end

end
