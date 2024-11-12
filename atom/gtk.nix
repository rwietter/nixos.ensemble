{ config, pkgs, theme, lib, vars, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = theme.gtk."${vars.appearance.theme}".theme.name;
      package = pkgs."${theme.gtk."${vars.appearance.theme}".theme.package}";
    };
    iconTheme = {
      name = theme.gtk."${vars.appearance.theme}".iconTheme.name;
      package = pkgs."${theme.gtk."${vars.appearance.theme}".iconTheme.package}";
    };
    font = {
      name = vars.os.font.mono;
      size = 12;
    };
    cursorTheme = {
      name = theme.gtk."${vars.appearance.theme}".cursor.name;
      package = pkgs."${theme.gtk."${vars.appearance.theme}".cursor.package}";
      size = 24;
    };
  };

  home.pointerCursor = {
    name = theme.gtk."${vars.appearance.theme}".cursor.name;
    package = pkgs."${theme.gtk."${vars.appearance.theme}".cursor.package}";
    size = 24;
  };

  xdg.configFile = lib.mkForce {
    "gtk-3.0/settings.ini" = {
      force = true;
      text = ''
        [Settings]
        gtk-theme-name = ${theme.gtk."${vars.appearance.theme}".theme.name}
        gtk-icon-theme-name = ${theme.gtk."${vars.appearance.theme}".iconTheme.name}
        gtk-font-name = ${vars.os.font.mono} 12
        gtk-cursor-theme-size = 24
        gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
        gtk-toolbar-icon-size = GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images = 1
        gtk-menu-images = 1
        gtk-enable-event-sounds = 1
        gtk-xft-antialias = 1
        gtk-xft-hinting = 1
        gtk-xft-hintstyle = hintfull
        gtk-xft-rgba = rgb
        gtk-cursor-theme-name = ${theme.gtk."${vars.appearance.theme}".cursor.name}
      '';
    };

    "gtk-4.0/settings.ini" = {
      force = true;
      text = ''
        [Settings]
        gtk-theme-name = ${theme.gtk."${vars.appearance.theme}".theme.name}
        gtk-icon-theme-name = ${theme.gtk."${vars.appearance.theme}".iconTheme.name}
        gtk-font-name = ${vars.os.font.mono} 12
        gtk-cursor-theme-size = 24
        gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
        gtk-toolbar-icon-size = GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images = 1
        gtk-menu-images = 1
        gtk-enable-event-sounds = 1
        gtk-xft-antialias = 1
        gtk-xft-hinting = 1
        gtk-xft-hintstyle = hintfull
        gtk-xft-rgba = rgb
        gtk-cursor-theme-name = ${theme.gtk."${vars.appearance.theme}".cursor.name}
      '';
    };
  };
}