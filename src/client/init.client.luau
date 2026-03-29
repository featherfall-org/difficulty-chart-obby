local components = require("@pkg/quill_rblx_components")
local core = require("@pkg/quill_core")
local dependencies = require("@pkg/quill_dependencies")
local lifecycles = require("@pkg/quill_rblx_lifecycles")
local logger = require("@pkg/quill_logger")

export type SingletonContainer = { ModuleScript }
export type SingletonFolder = Folder & SingletonContainer

local client_logger = logger.new("client_logger", logger.console_subscriber)

local client_ct: SingletonContainer = {}
local controllers: SingletonContainer = {}

local client_ct_folder = script:WaitForChild("ct") :: SingletonFolder
local controllers_folder = script:WaitForChild("controllers") :: SingletonFolder

for _, ct in client_ct_folder:GetChildren() do
    if ct:IsA("ModuleScript") then
        table.insert(client_ct, ct)
    end
end

for _, controller in controllers_folder:GetChildren() do
    if controller:IsA("ModuleScript") then
        table.insert(controllers, controller)
    end
end

core.new()
    :with_mod(dependencies.mod())
    :with_mod(lifecycles.mod())
    :with_mod(components.mod())
    :with_modules(client_ct)
    :with_modules(controllers)
    :write()

client_logger:info("Client successfully bootstrapped.")
