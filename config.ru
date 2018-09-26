require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require_relative './controllers/cars_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run App
