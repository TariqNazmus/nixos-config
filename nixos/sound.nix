{ config, pkgs, ... }:
{
  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = false; # Pulseaudio is not needed with PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; # Enable PulseAudio compatibility
  };
}