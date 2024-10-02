{ config, pkgs, ... }:

{
  # Enable EFI boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define the user
  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.openbox.enable = true;
  };

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    vim
    jetbrains.idea-community
    vscode
    conda
    firefox
  ];

  # Allow unfree packages (needed for some software like VSCode)
  nixpkgs.config.allowUnfree = true;

  # Set your time zone
  time.timeZone = "UTC";

  # This value determines the NixOS release with which your system is to be compatible
  system.stateVersion = "23.11"; # Change this to the NixOS version you're using
}