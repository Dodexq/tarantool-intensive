local schema = {}

function schema.init()
    if box.info.ro then return end
    --[[
        откроем доступ без пароля
    ]]

    box.schema.user.grant(
        'guest', 'super', nil, nil,
        { if_not_exists=true }
    )

    --[[
        Создание схемы данных, индексов
    ]]

    --[[
        Таблица `redirector` — хранилище коротких ссылок
        if_not_exists — флаг, о том чтобы не генерировать исключение, если спейс уже существует
    ]]
    box.schema.space.create(
        'redirector',
        { if_not_exists=true }
    )

    box.space.redirector:format({
        { name='source', type='string' },
        { name='short', type='string' },
        { name='bucket_id', type='unsigned'},
    })

    --[[
        Первичный ключ, первый создаваемый индекс
    ]]
    box.space.redirector:create_index(
        'primary',
        {
            parts = { 'source' },
            if_not_exists = true,
        }
    )

    --[[
        Вторичный индекс, для быстрого поиска строки по короткой ссылке
    ]]
    box.space.redirector:create_index(
        'short',
        {
            parts = { 'short' },
            if_not_exists = true,
        }
    )

    --[[
        Индекс для шардирования данных
    ]]
    box.space.redirector:create_index(
        'bucket_id',
        {
            parts = { 'bucket_id' },
            unique = false,
            if_not_exists = true,
        }
    )
end

return schema