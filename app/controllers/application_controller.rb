class ApplicationController < Sinatra::Base
    configure do
      set :views, "app/views"
      set :method_override, true
    end
    
    get "/" do
      erb :welcome
    end
    # bueno 

    get "/puppies" do 
      @puppies = Puppy.all
      erb :index
    end
    # bueno

    get "/puppies/new" do
      erb :new
    end

    get "/puppies/:id" do 
      @puppy=Puppy.find(params[:id])
      erb :show
    end
    # bueno

    post "/puppies" do 
      @puppy = Puppy.create(name: params[:name], breed: params[:breed])
      redirect "/puppies/#{@puppy.id}"
    end
    # bueno 

    get "/puppies/:id/edit" do
      @puppy = Puppy.find(params[:id])
      erb :edit
    end
    #bueno

    patch "/puppies/:id" do
      @puppy = Puppy.find(params[:id])
      @puppy.update(name: params[:name], breed: params[:breed])
      redirect "/puppies/#{@puppy.id}"
    end
    #bueno

    delete "/puppies/:id" do 
      Puppy.find(params[:id]).destroy
      redirect "/puppies"
    end
    #no bueno 


   
end
