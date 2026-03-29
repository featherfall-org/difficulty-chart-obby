local Process = require("./util/Process")
local fs = zune.fs
local task = zune.task

local function sync(options: {
    sourcemap_project: string,
    sync_project: string,
    out: string,
})
    Process.new("pesde"):argument("install"):inherit_stdout():run()
    task.spawn(function()
        local origin_metadata = fs.metadata("pesde.toml")
        assert(origin_metadata)

        local last_modified = origin_metadata.modified_at

        while true do
            task.wait(1)

            local metadata = fs.metadata("pesde.toml")
            if not metadata then
                continue
            end

            if last_modified < metadata.modified_at then
                last_modified = metadata.modified_at
                Process.new("pesde")
                    :argument("install")
                    :inherit_stdout()
                    :run()
            end
        end
    end)

    Process.new("rojo")
        :argument("sourcemap")
        :argument(options.sourcemap_project)
        :argument("-o")
        :argument("sourcemap.json")
        :argument("--watch")
        :inherit_stdout()
        :spawn()

    Process.new("darklua")
        :argument("process")
        :argument("--config")
        :argument(".darklua.json")
        :argument("--watch")
        :argument("src/")
        :argument(options.out)
        :option("env", {
            ROBLOX_DEV = "true",
        })
        :inherit_stdout()
        :spawn()

    Process.new("rojo")
        :argument("serve")
        :argument(options.sync_project)
        :inherit_stdout()
        :spawn()

    print(
        `[scripts] Syncing \`src/\` -> \`out/\` -> \`127.0.0.1:34872\``
    )
end

return sync
