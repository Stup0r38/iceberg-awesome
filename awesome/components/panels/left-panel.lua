--      ██╗     ███████╗███████╗████████╗    ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ██║     ██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--      ██║     █████╗  █████╗     ██║       ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--      ██║     ██╔══╝  ██╔══╝     ██║       ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--      ███████╗███████╗██║        ██║       ██║     ██║  ██║██║ ╚████║███████╗███████╗
--      ╚══════╝╚══════╝╚═╝        ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Imports
-- ===================================================================


local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi
local awful = require('awful')
local gears = require('gears')


-- ===================================================================
-- Bar Creation
-- ===================================================================


local LeftPanel = function(s)
  local left_panel = awful.wibar({
    position = "left",
    screen = s,
    bg = "#000000",
    fg = beautiful.fg_normal,
    width = dpi(55),
    height = s.geometry.height,
    shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 12)
    end
  })

  left_panel:setup {
    expand = "none",
    layout = wibox.layout.align.vertical,
    require("widgets.layout-box"),
    {
      layout = wibox.layout.fixed.vertical,
      -- add dock widget
      -- require("widgets.dock"),
      -- add folders widget
      require("widgets.xdg-folders"),
    },
    nil
  }

  function maximizeLeftPanel(bool)
  end
end

return LeftPanel