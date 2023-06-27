vshard = require('vshard')

local topology = require('topology')

vshard.storage.cfg({
        bucket_count = topology.bucket_count,
        sharding     = topology.sharding,

        memtx_dir  = "moscow-storage",
        wal_dir    = "moscow-storage",
        replication_connect_quorum = 1,
    },
    'aaaaaaaa-0000-4000-a000-000000000011')

local schema = require('schema')

require('console').start() os.exit(0)