local tap = require 'tap'
local tnt = require 't.tnt'
tnt.cfg{}

local test = tap.test("myapp1")
test:plan(1)

test:ok(1 == 1, "1 == 1")

tnt.finish()
test:check()
os.exit(0)
