require 'sinatra'
require 'json'


get '/' do
    'Welcome to my API in Ruby!'
end

get '/items' do
    content_type :json
    items = [
        { id: 1, name: 'item 1' },
        { id: 2, name: 'item 2' },
        { id: 3, name: 'item 3' },
    ]
    items.to_json
end

get '/items/:id' do
    content_type :json
    items = [
        { id: 1.1, name: 'item 1.1' },
        { id: 2.1, name: 'item 2.1' },
        { id: 3.1, name: 'item 3.1' },
    ]
    item = items.find { |i| i[:id] == params[:id].to_i }
    if item
        item.to_json
    else
        halt 404, { error: 'Item not found' }.to_json
    end
end

post '/items' do
    content_type :json
    request_body = JSON.parse(request_body.read)
    new_item = {
        id: rand(100..999),
        name: request_body['name']
    }
    status 201
    new_item.to_json
end