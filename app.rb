require 'sinatra'
require_relative 'config/application'
require "pry"

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  user_id = session[:user_id]
  if !user_id.nil?
    @memberlist = [User.find(user_id)]
  end
  erb :'meetups/show'
end

get '/new' do
  erb :'meetups/new'
end

post '/new' do
  @name = params["name"]
  @description = params["description"]
  # creator = params["creator"]
  # from session
  @location = params["location"]

  if (@name.empty? || @description.empty? || @location.empty?)
    flash.now[:notice] = "Please fill in form completely!"
    erb :"meetups/new"
  else
    @new_meetup = Meetup.create({name: @name, description: @description, location: @location, creator: session[:user_id]})
    flash[:notice] = "New meetup #{@name} created!"
    redirect "/meetups/#{@new_meetup.id}"
    # erb :'meetups/new'
  end
end
