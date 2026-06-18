local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 14.0
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

local active_tab_background = "#B84B6A"
local inactive_tab_background = "#5c6d74"
local tab_bar_background = "#000000"
local tab_padding_width = 2
local tab_padding = string.rep(" ", tab_padding_width)
local active_tab_left_edge = wezterm.nerdfonts.ple_left_half_circle_thick
local active_tab_right_edge = wezterm.nerdfonts.ple_right_half_circle_thick

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
    background = tab_bar_background,
    active_tab = {
      bg_color = active_tab_background,
      fg_color = "#FFFFFF",
    },
    inactive_tab = {
      bg_color = inactive_tab_background,
      fg_color = "#FFFFFF",
    },
    inactive_tab_edge = tab_bar_background,
    inactive_tab_edge_hover = tab_bar_background,
  },
}

local function tab_background(tab)
  if tab.is_active then
    return active_tab_background
  end

  return inactive_tab_background
end

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

wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, _hover, max_width)
  local background = tab_background(tab)
  local foreground = "#FFFFFF"
  local tab_edge_width = 2
  local title_width = math.max(1, max_width - (tab_padding_width * 2) - tab_edge_width)
  local title = tab_padding .. wezterm.truncate_right(current_dir_name(tab.active_pane), title_width) .. tab_padding

  local elements = {}

  table.insert(elements, { Background = { Color = tab_bar_background } })
  table.insert(elements, { Foreground = { Color = background } })
  table.insert(elements, { Text = active_tab_left_edge })

  table.insert(elements, { Background = { Color = background } })
  table.insert(elements, { Foreground = { Color = foreground } })
  table.insert(elements, { Text = title })

  table.insert(elements, { Background = { Color = tab_bar_background } })
  table.insert(elements, { Foreground = { Color = background } })
  table.insert(elements, { Text = active_tab_right_edge })

  return elements
end)

config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
