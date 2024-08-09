local M = {}

-- External Plugins
local formatter_plugin_config = require("formatter.config")
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

local function configure_formatter(filetype, config)
  install_package(config.package)

  formatter_plugin_config.values.filetype[filetype] = { config.opts }
end

local function configure_lsp(config)
  -- Mason package differs from lspconfig package.
  -- I need to get the mason package name from the lspconfig package name.
  local mason_package = mason_lspconfig.get_mappings().lspconfig_to_mason[config.package]
  install_package(mason_package)

  lsp_plugin_config[config.package].setup(config.opts)
end

function M.apply_language_configuration(language)
  print("Applying language configuration for " .. language)

  local spec = plugin_config.get_language_spec(language)

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
