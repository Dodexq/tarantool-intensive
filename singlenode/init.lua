box.cfg{}

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

box.space.redirector:insert({"http://google.com/?q=tarantool", "9da443d847"})
box.space.redirector:insert({"https://www.tarantool.io/en/doc/latest/", "e5b1f259a8"})
box.space.redirector:insert({"https://db-engines.com/en/system/Tarantool", "ad0e253828"})
box.space.redirector:insert({"https://mcs.mail.ru", "47bfb2302e"})
box.space.redirector:insert({"https://github.com/tarantool/tarantool/", "c1ceeaaf95"})

require('console').start() os.exit(0)