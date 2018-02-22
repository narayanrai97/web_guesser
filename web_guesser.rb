require 'sinatra'
require 'sinatra/reloader'

$rdm = "The SECRET NUMBER is #{rand(0..100)}"

get '/' do
    $rdm
end




