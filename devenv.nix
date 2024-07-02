{ pkgs, lib, ... }:

let ruby = pkgs.ruby;
in {
  packages =
    [ ruby pkgs.git pkgs.cmake pkgs.ncurses pkgs.pkg-config pkgs.openssl ];

  env = {

    # Make sure that the regular user's environment doesn't collide with our nix gems
    BUNDLE_PATH = "./.devenv/bundle";
    GEM_HOME = "./.devenv/bundle/${ruby.rubyEngine}/${ruby.version.libDir}";
    GEM_PATH = "./.devenv/bundle/${ruby.rubyEngine}/${ruby.version.libDir}";
    BUNDLE_FORGET_CLI_OPTIONS = "true";
  };
}
