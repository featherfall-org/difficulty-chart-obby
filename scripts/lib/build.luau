local Process = require("./util/Process")
local fs_util = require("./util/fs")

local function build(options: {
    sourcemap_project: string,
    build_project: string,
    out: string,
})
    Process.new("pesde"):argument("install"):inherit_stdout():run()

    local cleanup_mime = fs_util.mime_folders { "roblox_packages" }

    Process.new("rojo")
        :argument("sourcemap")
        :argument(options.sourcemap_project)
        :argument("-o")
        :argument("sourcemap.json")
        :inherit_stdout()
        :run()

    Process.new("darklua")
        :argument("process")
        :argument("--config")
        :argument(".darklua.json")
        :argument("src/")
        :argument("out/")
        :option("env", {
            ROBLOX_DEV = "true",
        })
        :inherit_stdout()
        :run()

    Process.new("rojo")
        :argument("build")
        :argument(options.build_project)
        :argument("-o")
        :argument(options.out)
        :inherit_stdout()
        :run()

    cleanup_mime()
end

return build
