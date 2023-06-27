return {
    bucket_count = 16,
    sharding = {
        ['aaaaaaaa-0000-4000-a000-000000000000'] = {
            replicas = {
                ['aaaaaaaa-0000-4000-a000-000000000011'] = {
                    name = 'moscow-storage',
                    master=true,
                    uri="guest@127.0.0.1:30011"
                },
                ['aaaaaaaa-0000-4000-a000-000000000012'] = {
                    name = 'moscow-replica',
                    master=false,
                    uri="guest@127.0.0.1:30012"
                },
            }
        },
        ['bbbbbbbb-0000-4000-a000-000000000000'] = {
            replicas = {
                ['bbbbbbbb-0000-4000-a000-000000000021'] = {
                    name='spb-storage',
                    master=true,
                    uri="guest@127.0.0.1:30021"
                },
                ['bbbbbbbb-0000-4000-a000-000000000022'] = {
                    name='spb-replica',
                    master=false,
                    uri="guest@127.0.0.1:30022"
                },
            },
        },
    }
}
