local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    screenshot = 'flameshot full -p ~/Pictures',
    region_screenshot = 'flameshot gui -p ~/Pictures',
    delayed_screenshot = 'flameshot full -p ~/Pictures -d 5000',
  --browser = 'vivaldi-stable',
    browser = 'brave',
    editor = 'notepadqq', -- gui text editor
  --social = 'discord',
    social = 'zoom',
    game = rofi_command,
    files = 'dolphin',
    --files = 'spacefm',
  --music = rofi_command 
    music = 'cantata'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',
    --'nm-applet --indicator', -- wifi
    --'pnmixer', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'xfce4-power-manager', -- Power manager
     --'flameshot',
     --'synology-drive -minimized',
     -- Add delay (troubleshooting)
     --'sleep 10;',
     'export QT_QPA_PLATFORMTHEME=qt5ct',
     'sleep 5; ckb-next -b',
     --'/usr/bin/barrier',
     --'~/.local/bin/wallpaper', -- wallpaper-reddit script
     --'/usr/lib/kdeconnect',
     'sleep 5; killall -9 klipper; klipper',
     'birdtray',
     'sleep 2; xwallpaper --zoom /home/mike/Pictures/Wallpapers/Normal/shodan.png &',
     'steam -silent',
     'sleep 5; gammy',
     'sleep 5; keepassxc',
     'sleep 5; /usr/lib/kdeconnectd',
     'sleep 5; kdeconnect-indicator',
     
     --'kdeconnect-cli --refresh; kdeconnect-cli -l',
     
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
    
    --'xwallpaper --zoom "Pictures/misc/Wallpapers/Upscaled/shodan_xxl_by_deviantnoisemaker_d135ytc-fullview_[L2][x4.00][T].png"'
    --'klipper &'
    --'sleep 2; xwallpaper --zoom /home/mike/Pictures/Wallpapers/Normal/shodan.png &',
    --'sleep 2; killall -9 klipper; klipper &'
    --'kdeconnect-cli --refresh; kdeconnect-cli -l'
  }
}
