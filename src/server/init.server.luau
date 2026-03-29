local components = require("@pkg/quill_rblx_components")
local core = require("@pkg/quill_core")
local dependencies = require("@pkg/quill_dependencies")
local lifecycles = require("@pkg/quill_rblx_lifecycles")
local logger = require("@pkg/quill_logger")

local server_logger = logger.new("sever_logger", logger.console_subscriber)

local ct = script:WaitForChild("ct"):GetChildren() :: { ModuleScript }
local services =
    script:WaitForChild("services"):GetChildren() :: { ModuleScript }

core.new()
    :with_mod(dependencies.mod())
    :with_mod(lifecycles.mod())
    :with_mod(components.mod())
    :with_modules(ct)
    :with_modules(services)
    :write()

server_logger:info("Server successfully bootstrapped.")
