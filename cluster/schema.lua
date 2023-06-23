if box.info.ro then
    return
end

box.schema.user.grant('guest', 'super', nil, nil, {if_not_exists=true}) -- grant replication role

box.schema.space.create('redirector', { if_not_exists=true })
box.space.redirector:format({
    { name='source',    type='string' }, -- исходная сслылка
    { name='short',     type='string' },  -- сокращенная ссылка 
    { name='bucket_id', type='unsigned' },  -- сокращенная ссылка 
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

box.space.redirector:create_index(
    'bucket_id',
    {
        parts={ "bucket_id" },
        unique=false, if_not_exists=true,
    }
)