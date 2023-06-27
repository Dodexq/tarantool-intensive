local log = require('log')
local client = require('http.client')

local host = '127.0.0.1'
local port = 8081

local source = 'https://google.com/?q=' .. tostring(os.time())
local makeshort = 'http://' .. host .. ':' .. port .. '/?url='
local response = client.get(makeshort .. source)
local short = response.body
print(short, '->', source)
local redirect = client.get(short, {follow_location=false})

assert(redirect.headers['location'] == source,
    "Source url and redirect not equal: " .. source .. " " ..
    redirect.headers['location'] )