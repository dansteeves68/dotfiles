{
  # What the hell is "NSGlobalDomain"?
  system.defaults.NSGlobalDomain = {
    # "com.apple.trackpad.scaling" = 3.0;
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
    appswitcher-all-displays = false; # Whether to display the appswitcher on all displays or only the main one. The default is false.
    autohide = true;  # Whether to automatically hide and show the dock.
    autohide-delay = 0.1;  # Sets the speed of the autohide delay. The default is 
    autohide-time-modifier = 0.5;  # Sets the speed of the animation when hiding/showing the Dock. The default is given in the example.
    dashboard-in-overlay = false; # Whether to hide Dashboard as a Space. The default is false.
    enable-spring-load-actions-on-all-items = false; # Enable spring loading for all Dock items. The default is false.
    expose-group-by-app = false; # Whether to group windows by application in Mission Control's Exposé. The default is true.
    launchanim = false; # Animate opening applications from the Dock. The default is true.
    mineffect = null; # Set the minimize/maximize window effect. The default is genie.
    minimize-to-application = false; # Whether to minimize windows into their application icon. The default is false.
    mouse-over-hilite-stack = false;  # Enable highlight hover effect for the grid view of a stack in the Dock.
    mru-spaces = true; # Whether to automatically rearrange spaces based on most recent use. The default is true.
    orientation = "bottom";  # Position of the dock on screen. The default is "bottom".
    show-process-indicators = true;
    show-recents = false;
    showhidden = false; # Whether to make icons of hidden applications tranclucent. The default is false.
    # static-only = true; # Show only open applications in the Dock
    tilesize = 64; # Size of the icons in the dock. The default is 64.
    wvous-bl-corner = 1; # Hot corner action 1 Disabled
    wvous-br-corner = 1; # Hot corner action 1 Disabled
    wvous-tl-corner = 4; # Hot corner action 4 Desktop
    wvous-tr-corner = 1; # Hot corner action 1 Disabled
  };

  # Finder
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    CreateDesktop = false; # Whether to show icons on the desktop or not.
    FXEnableExtensionChangeWarning = true;
    FXPreferredViewStyle = "Nlsv";
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
    Clicking = true; # true to enable tap-to-click
    TrackpadRightClick = true;
  };
}
