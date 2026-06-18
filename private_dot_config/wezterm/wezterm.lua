local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 14.0
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 2
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
  font_size = 13.0,
}
config.window_background_gradient = {
  colors = { "#000000" },
}
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

local function basename(path)
  if not path or path == "" then
    return nil
  end

  local normalized = path:gsub("[/\\]+$", "")
  return normalized:match("([^/\\]+)$") or normalized
end

local function current_dir_name(pane)
  local cwd = pane.current_working_dir
  if cwd then
    local name = basename(cwd.file_path or tostring(cwd))
    if name then
      return name
    end
  end

  return basename(pane.title) or pane.title or ""
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(current_dir_name(tab.active_pane), max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
