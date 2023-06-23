box.cfg {
    listen = '127.0.0.1:3301',
    replication = {
        '127.0.0.1:3301',
        '127.0.0.1:3302',
    },
    memtx_dir  = "moscow-storage",
    wal_dir    = "moscow-storage",
    replication_connect_quorum = 1,
    replicaset_uuid = 'aaaaaaaa-0000-4000-a000-000000000000',
    instance_uuid = 'aaaaaaaa-0000-4000-a000-000000000011'
}

require('schema')

require('console').start() os.exit()