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
  @memberships = @meetup.memberships
  erb :'meetups/show'
end

get '/new' do
  erb :'meetups/new'
end

post '/join/:id' do
  @meetup = Meetup.find(params[:id])
  if !session[:user_id]
    flash.now[:notice] = "Please sign in to join this meetup!"
    @memberships = @meetup.memberships
    erb :'meetups/show'
  else
    Membership.create({user_id: session[:user_id], meetup_id: @meetup.id})
    @memberships = @meetup.memberships
    redirect "/meetups/#{params[:id]}"
  end
end

post '/new' do
  @name = params["name"]
  @description = params["description"]
  @location = params["location"]

  if (@name.empty? || @description.empty? || @location.empty?)
    flash.now[:notice] = "Please fill in form completely!"
    erb :"meetups/new"
  else
    @new_meetup = Meetup.create({name: @name, description: @description, location: @location, creator_id: session[:user_id]})
    flash[:notice] = "New meetup #{@name} created!"
    redirect "/meetups/#{@new_meetup.id}"
  end
end
