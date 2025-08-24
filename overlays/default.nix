# Placeholder
{inputs, ...}: [
  # Homebrew repositiory
  inputs.brew-nix.overlays.default

  # Add copyparty
  inputs.copyparty.overlays.default

  # Add minecraft
  inputs.nix-minecraft.overlay
]
