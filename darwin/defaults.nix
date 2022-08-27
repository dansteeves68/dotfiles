{
  # What the hell is "NSGlobalDomain"?
  system.defaults.NSGlobalDomain = {
    "com.apple.trackpad.scaling" = "3.0";
    AppleInterfaceStyleSwitchesAutomatically = true;
    # AppleMeasurementUnits = "Centimeters";
    # AppleMetricUnits = 1;
    AppleShowScrollBars = "Automatic";
    # AppleTemperatureUnit = "Celsius";
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    _HIHideMenuBar = false;
  };

  # Firewall
  system.defaults.alf = {
    globalstate = 1;
    allowsignedenabled = 1;
    allowdownloadsignedenabled = 1;
    stealthenabled = 1;
  };

  # Dock and Mission Control
  system.defaults.dock = {
    autohide = true;
    autohide-delay = "0.5";
    autohide-time-modifier = "1.0";
    expose-group-by-app = false;
    launchanim = false;
    mineffect = null;
    mru-spaces = false;
    show-process-indicators = true;
    show-recents = false;
    static-only = false;
    tilesize = 128;
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 4;
    wvous-tr-corner = 1;
  };

  # Finder
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    CreateDesktop = false; # Whether to show icons on the desktop or not.
    FXEnableExtensionChangeWarning = true;
    ShowPathbar = true;
    ShowStatusBar = false;
    QuitMenuItem = true;
  };

  # Login and lock screen
  system.defaults.loginwindow = {
    GuestEnabled = false;
    DisableConsoleAccess = true;
  };

  # Screenshots
  system.defaults.screencapture.location = "~/Screenshots/";

  # Spaces
  system.defaults.spaces.spans-displays = false;

  # Trackpad
  system.defaults.trackpad = {
    Clicking = false;
    TrackpadRightClick = true;
  };
}
