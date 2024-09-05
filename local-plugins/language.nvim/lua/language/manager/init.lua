local M = {}

-- External Plugins
local dap_plugin_config = require("dap")
local formatter_plugin_config = require("formatter.config")
local linter_plugin_config = require("lint")
local lsp_plugin_config = require("lspconfig")
-- Mason
local mason_lspconfig = require("mason-lspconfig")
local mason_registry = require("mason-registry")
-- Language Plugin
local plugin_config = require("language.config")

local function install_package(package_name)
  local package = mason_registry.get_package(package_name)
  package:install()
end

local function configure_dap(filetype, config)
  install_package(config.package)

  dap_plugin_config.adapters[filetype] = config.adapter
  dap_plugin_config.configurations[filetype] = { config.configuration }
end

local function configure_linter(filetype, config)
  install_package(config.package)

  local filetype_linters = linter_plugin_config.linters_by_ft[filetype] or {}

  table.insert(filetype_linters, config.package)

  linter_plugin_config.linters_by_ft[filetype] = filetype_linters

  local linterOptions = config.opts or {}

  for option, value in pairs(linterOptions) do
    linter_plugin_config.linters[config.package][option] = value
  end
end

local function configure_formatter(filetype, config)
  install_package(config.package)

  formatter_plugin_config.values.filetype[filetype] = { config.opts }
end

local function configure_lsp(config)
  -- Mason package differs from lspconfig package.
  -- I need to get the mason package name from the lspconfig package name.
  local mason_package = mason_lspconfig.get_mappings().lspconfig_to_mason[config.package]
  install_package(mason_package)

  local lsp_options = config.opts or {}

  lsp_plugin_config[config.package].setup(lsp_options)
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

return M
