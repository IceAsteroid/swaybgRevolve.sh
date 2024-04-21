# swaybgRevolve.sh
A script that revolves up and down walpapers in a specified directory.

# Help page
```
Usage:
  swaybgRevolve.sh [OPTION]
  -u  Revolve wallpapers up
  -d  Revolve wallpapers down
```

# Features
* Specify the wallpaper directory in the variable ```wallpaperDir```, for instance ```wallpaperDir="${HOME}/Wallpapers/SwayBG"```

* Bind the script separately to two keybindings with corresponding up and down options. Often two nearby keybindings for better operation. 

  For example:
  ```
  bindsym $mod+Shift+n exec "$HOME/xxx/swaybgRevolve.sh -u &>/dev/null"
  bindsym $mod+Shift+m exec "$HOME/xxx/swaybgRevolve.sh -d &>/dev/null"
  ```



