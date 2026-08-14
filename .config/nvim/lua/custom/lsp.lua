return {
  ensure_installed = {
    'bash-language-server',
    'python-lsp-server',
    'nextflow-language-server',
  },
  servers = {
    bashls = {},
    pylsp = {},
    nextflow_ls = {
      -- Mason installs this package as a wrapper around its bundled JAR.
      cmd = { 'nextflow-language-server' },
    },
  },
}
