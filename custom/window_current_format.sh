show_window_current_format() {
  local number background color text fill key_table window_status_icon_enable current_window_format
  number="#I"
  background="$thm_gray"
  color="$thm_green"
  text="$(get_tmux_option "@catppuccin_window_current_text" "#{b:pane_current_path}")" # use #W for application instead of directory
  fill="$(get_tmux_option "@catppuccin_window_current_fill" "number")" # number, all, none


  key_table="$(tmux display -p '#{client_key_table}')"
  if [[ "$key_table" = "off" ]]; then
    window_status_icon_enable="$(get_tmux_option "@catppuccin_window_status_icon_enable" "yes")"
    if [[ "$window_status_icon_enable" = "yes" ]]; then
      text="󰌾 $text"
    else
      text="[LOCKED] $text"
    fi
  fi

  current_window_format=$( build_window_format "$number" "$color" "$background" "$text" "$fill" )

  echo "$current_window_format"
}
