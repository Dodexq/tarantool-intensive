box.cfg {
    read_only=true,
    listen = '127.0.0.1:3302',
    replication = {
        '127.0.0.1:3301',
        '127.0.0.1:3302',
    },
    memtx_dir  = "moscow-replica",
    wal_dir    = "moscow-replica",
    replication_connect_quorum = 1,
    replicaset_uuid = 'aaaaaaaa-0000-4000-a000-000000000000',
    instance_uuid = 'aaaaaaaa-0000-4000-a000-000000000012'
}
require('console').start() os.exit()