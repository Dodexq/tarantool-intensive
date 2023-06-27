local log = require('log')
local socket = require('socket')
local digest = require('digest')
local httpd = require('http.server').new('0.0.0.0', tonumber(os.getenv('TT_HTTP_PORT')))

--[[
    HTTP сервер обработки запросов
]]
local hostname = '192.168.0.200'

--[[
    HTML форма для создания короткой ссылки
]]
local form = [[
<html>
<head></head>
<body>
    <form>
    <input name=url type=text />
    <input type=submit />
    </form>
</body>
</html>
]]

function root(req)
    local url = req:param('url')
    if url ~= nil then
        local short = app.shorten(url)
        if short == nil then
            return {
                status = 404,
            }
        end

        local pasteable_short = 'http://' .. hostname .. ':' .. os.getenv('TT_HTTP_PORT') .. '/' .. short
        return {
            status = 200,
            headers = { ['content-type'] = 'text/html; charset=utf8' },
            body = pasteable_short
        }
    end

    return {
        status = 200,
        headers = { ['content-type'] = 'text/html; charset=utf8' },
        body = form
    }
end

function short(req)
    local short = req:stash('short')
    local source = app.url(short)
    if source == nil then
        return {status=404}
    end

    return {
        status = 301, 
        headers = { ['location'] = source },
    }
end

httpd:route(
    { path = '/:short' }, short)

    httpd:route(
    { path = '/' }, root)

local function init()
    httpd:start()
end

local function stop()
    if httpd ~= nil then
        httpd:stop()
    end
    httpd = nil
end

return {
    init=init,
    stop=stop,
}