{ config, pkgs, ... }:
{
  # Enable sound
  pulseaudio.enable = false; # Pulseaudio is not needed with PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    #wireplumber.enable = true; # systemd only
    pulse.enable = true; # Enable PulseAudio compatibility
  };
    environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}