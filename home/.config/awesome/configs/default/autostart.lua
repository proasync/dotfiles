local awful = require("awful")

-- Function to run commands once
local function run_once(cmd)
  awful.spawn.with_shell("pgrep -u $USER -fx '" .. cmd .. "' > /dev/null || (" .. cmd .. ")")
end

-- Launch applications with specific tag placement at startup
awful.spawn(function()
  -- Launch Google Chrome on screen 2, tag "➒" on startup
  local screen_index = 2
  local tag_name = "➊"
  local cmd = "google-chrome-stable --no-default-browser-check"

  -- Start the application
  awful.spawn(cmd, {
    screen = screen_index,
    tag = awful.tag.find_by_name(awful.screen.getbyindex(screen_index), tag_name),
    switchtotag = true, -- Optionally switch to the tag when launching
    maximized = true,   -- Start maximized if desired
  })
end)

-- Autostart other applications
local startup_apps = {
  "nm-applet",
  "pamac-tray",
  "xfce4-power-manager",
  "blueberry-tray",
  "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
  "numlockx on",
  "volumeicon",
  "nitrogen --restore",
  "dbeaver",         -- Start DBeaver
  "teams-for-linux", -- Start Teams
  "spotify"          -- Start Spotify

}

for _, app in ipairs(startup_apps) do
  run_once(app)
end
