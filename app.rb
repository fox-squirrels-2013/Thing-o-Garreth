require 'rubygems'
require 'active_record'
require 'sinatra'
require_relative './app/models/habit.rb'


ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'habit_db')



get '/' do
  erb :index
end

post '/habit' do
  habit = Habit.new
  habit.habit_name = params[:name]
  habit.habit_description = params[:content]
  habit.file_type = params[:img]
  habit.created_at = Time.now
  habit.updated_at = Time.now
  habit.save
  erb :index
end


get '/all' do
    @habit_list = Habit.all
    erb :read
end

get '/habit/:id' do
  @habit = Habit.find(params[:id])
  erb :form
end

post '/update/:id' do
 @habit = Habit.find(params[:id])
  @habit.habit_name = params[:name]
  @habit.save
  @habit_list = Habit.all
  erb :index

end

