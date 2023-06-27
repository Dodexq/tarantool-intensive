local app = {}
local digest = require 'digest'
local vshard = require 'vshard'

function app.url(short)
    local bucket_id = vshard.router.bucket_id_mpcrc32(short)
    local url, err = vshard.router.callro(
        bucket_id,
        'box.space.redirector.index.short:get',
        {short}
    )
    if url ~= nil then
        return url[1]
    elseif err ~= nil then
        error(err)
    else
        return
    end
end

function app.shorten(url)
    -- while true do
        --[[ map/reduce для поиска существующего url ]]
        local shards, err = vshard.router.routeall()
        if err ~= nil then error(err) end
        for uid, replica in pairs(shards) do
            local rec = replica:callro('box.space.redirector:get',{ url })
            if rec ~= nil then
                return rec[2]
            end
        end

        --[[ пробуем создать ]]
        local short = digest.sha1_hex(url):sub(1,10)
        local bucket_id = vshard.router.bucket_id_mpcrc32(short)
        local success, err = vshard.router.callrw(
            bucket_id,
            'box.space.redirector:insert',
            { {url, short, bucket_id} },
            { timeout = 1 }
        )
        if success then
            return short
        elseif err ~= nil then
            error(err)
        end
    -- end
end

return app