vshard = require('vshard')
local topology = require('topology')
local fio = require('fio')
local schema = require('schema')

local instance_name = assert(
    os.getenv('TT_INSTANCE_NAME'), "TT_INSTANCE_NAME required"
)
local data_dir = os.getenv('TT_DATADIR') or "data/"..instance_name
if not fio.stat(data_dir) then
    fio.mktree(data_dir)
end

vshard.storage.cfg({
        bucket_count = topology.BUCKET_COUNT,
        sharding = topology.sharding,
        memtx_dir = data_dir,
        wal_dir = data_dir,
        replication_connect_quorum = 1,
    },
    assert(os.getenv('TT_INSTANCE_UUID',"TT_INSTANCE_UUID required"))
)

vshard.router.cfg{
    bucket_count = topology.BUCKET_COUNT,
    sharding = topology.sharding,
}

schema.init()
app = require 'app'

server = require 'server'
server.init()