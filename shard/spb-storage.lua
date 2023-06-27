vshard = require('vshard')

local topology = require('topology')

vshard.storage.cfg({
        bucket_count = topology.bucket_count,
        sharding     = topology.sharding,

        memtx_dir  = "spb-storage",
        wal_dir    = "spb-storage",
    },
    'bbbbbbbb-0000-4000-a000-000000000021')

local schema = require('schema')

require('console').start() os.exit(0)