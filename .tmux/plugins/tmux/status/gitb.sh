# Requires https://github.com/arl/gitmux

show_gitb() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_gitmux_icon" "󰊢")"
  color="$(get_tmux_option "@catppuccin_gitmux_color" "$thm_green")"
  # text="$(get_tmux_option "@catppuccin_gitmux_text" "#(gitmux \"#{pane_current_path}\")")"
  text="$(get_tmux_option "@catppuccin_gitmux_text" "#(cd #{pane_current_path} && git rev-parse --abbrev-ref HEAD 2>/dev/null || echo '')")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "$module"
}
