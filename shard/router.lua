vshard = require('vshard')
topology = require('topology')
vshard.router.cfg(topology)
require('console').start() os.exit(0)