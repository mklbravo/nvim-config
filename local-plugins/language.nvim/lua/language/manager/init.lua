local M = {}

-- External Plugins
local dap_plugin_config = require("dap")
local formatter_plugin_config = require("formatter.config")
local linter_plugin_config = require("lint")
-- Mason
local mason_registry = require("mason-registry")
-- Language Plugin
local plugin_config = require("language.config")

local function install_package(package_name)
  -- DOCU: https://github.com/williamboman/mason.nvim/blob/main/doc/reference.md#package
  local package = mason_registry.get_package(package_name)

  if package == nil then
    print(string.format("Package `%s` not found in the registry.", package_name))
    return
  end

  if not package:is_installed() then
    package:once(
      "install:failed",
      vim.schedule_wrap(function()
        print(string.format("Failed to install package: `%s`", package_name))
      end)
    )

    package:once(
      "install:success",
      vim.schedule_wrap(function()
        print(string.format("Successfuly installed package: `%s`", package_name))
      end)
    )

    -- DOCU: https://github.com/williamboman/mason.nvim/blob/main/doc/reference.md#package
    local install_handle = package:install()

    print(string.format("Installing package `%s`", package_name))

    vim.wait(10000, function()
      return install_handle:is_closed()
    end, 1)
  end
end

local function configure_dap(filetype, config)
  dap_plugin_config.adapters[filetype] = config.adapter
  dap_plugin_config.configurations[filetype] = { config.configuration }
end

local function configure_linter(filetype, config)
  local filetype_linters = linter_plugin_config.linters_by_ft[filetype] or {}

  table.insert(filetype_linters, config.package)

  linter_plugin_config.linters_by_ft[filetype] = filetype_linters

  local linterOptions = config.opts or {}

  for option, value in pairs(linterOptions) do
    linter_plugin_config.linters[config.package][option] = value
  end
end

local function configure_formatter(filetype, config)
  formatter_plugin_config.values.filetype[filetype] = { config.opts }
end

local function configure_lsp(config)
  local lsp_options = config.opts or {}

  vim.lsp.enable(config.package)
  vim.lsp.config(config.package, lsp_options)
end

function M.apply_language_configuration(language)
  local spec = plugin_config.get_language_spec(language)

  local dap_config = spec.dap
  if dap_config ~= nil then
    configure_dap(spec.filetype, dap_config)
  end

  local linter_config = spec.linter
  if linter_config ~= nil then
    configure_linter(spec.filetype, linter_config)
  end

  local lsp_config = spec.lsp
  if lsp_config ~= nil then
    configure_lsp(lsp_config)
  end

  local formatter_config = spec.formatter
  if formatter_config ~= nil then
    configure_formatter(spec.filetype, formatter_config)
  end
end

function M.install_language_packages(language)
  local required_package_names = plugin_config.get_language_required_mason_package_names(language)

  for _, package_name in ipairs(required_package_names) do
    install_package(package_name)
  end
end

return M
