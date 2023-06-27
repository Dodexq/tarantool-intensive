return {
    BUCKET_COUNT = 16,
    sharding = {
        ['aaaaaaaa-0000-0000-0000-000000000000'] = {
            -- replicaset #1
            replicas = {
                ['aaaaaaaa-0000-0000-0000-000000000001'] = {
                    uri = 'guest@127.0.0.1:3301',
                    name = 'spb',
                    master = true
                },
            },
        },
        ['bbbbbbbb-0000-0000-0000-000000000000'] = {
            -- replicaset #2
            replicas = {
                ['bbbbbbbb-0000-0000-0000-000000000001'] = {
                    uri = 'guest@127.0.0.1:3401',
                    name = 'moscow',
                    master = true
                },
            },
        },
    },
}