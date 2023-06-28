function myproc(id)
    local tup = box.space.myspace.index.primary:select({id}, {iterator='GE'})
    return tup
end

function transaction(number)
    box.space.myspace:drop()
    box.schema.space.create('myspace')
    box.space.myspace:create_index('primary', {type='TREE', unique=true, if_not_exists=true, parts={1, 'unsigned'}})
    box.begin()
    
    for i = 1, number do
        box.space.myspace:auto_increment({'test', i, 1994 * i})
    end

    box.commit()
    return box.space.myspace:select{}
end