box.cfg{
    listen = '127.0.0.1:3302',
}

box.schema.space.create('redirector', { if_not_exists=true })

box.space.redirector:format({
    { name='source', type='string' },
    { name='short', type='string' }, 
})

box.space.redirector:create_index(
    'primary',
    {
        parts = { 'source' },
        if_not_exists = true,
    }
)

box.space.redirector:create_index(
    'short',
    {
        parts = { 'short' },
        if_not_exists = true,
    }
)

local links = {
    {"http://google.com/?q=tarantool", "9da443d847"},
    {"https://www.tarantool.io/en/doc/latest/", "e5b1f259a8"},
    {"https://db-engines.com/en/system/Tarantool", "ad0e253828"},
    {"https://mcs.mail.ru", "47bfb2302e"},
    {"https://github.com/tarantool/tarantool/", "c1ceeaaf95"}
}

local space = box.space.redirector

for _, link in ipairs(links) do
    space:insert(link)
end

require('console').start() os.exit(0)