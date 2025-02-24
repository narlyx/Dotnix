{inputs, ...}: {
  # Homebrew casks for MacOS systems
  brew-nix = final: prev: {
    brewCasks = import inputs.brew-nix.default;
  };
}
