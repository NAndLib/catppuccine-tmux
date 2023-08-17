show_window_current_format() {
  local number="#I"
  local background="$thm_gray"
  local color="$thm_green"
  local text="$(get_tmux_option "@catppuccin_window_current_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  local fill="$(get_tmux_option "@catppuccin_window_current_fill" "number")" # number, all, none


  local key_table="$(tmux display -p '#{client_key_table}')"
  if [[ "$key_table" = "off" ]]; then
    local window_status_icon_enable="$(get_tmux_option "@catppuccin_window_status_icon_enable" "yes")"
    if [[ "$window_status_icon_enable" = "yes" ]]; then
      text="$text 󰌾 "
    else
      text="$text [LOCKED]"
    fi
  fi

  local current_window_format=$( build_window_format "$number" "$color" "$background" "$text" "$fill" )

  echo "$current_window_format"
}
