{
  # Garbage collect the Nix store
  nix.gc = {
    # automatic = true; # don't do this if we have programs.nh.clean.enable set
    # Change how often the garbage collector runs (default: weekly)
    # frequency = "monthly";
  };
}
