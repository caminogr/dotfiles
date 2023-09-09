local mason = require('mason')

mason.setup({
   ui = {
     icons = {
       server_installed = "✓",
       server_pending = "➜",
       server_uninstalled = "✗",
       package_installed = "✓",
       package_pending = "➜",
       package_uninstalled = "✗"
     }
   }
 })
