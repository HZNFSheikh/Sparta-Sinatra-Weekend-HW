require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './controllers/worldcup_controller.rb'
require_relative './controllers/olympics_controller.rb'

use Rack::MethodOverride

run WorldCupController
use OlympicsController
