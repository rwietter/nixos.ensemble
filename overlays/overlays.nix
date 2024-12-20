self: super: 
{ 
  myAwesome = super.awesome.overrideAttrs (old: rec 
  { 
    pname = "myAwesome"; 
    version = "git-20220614-3a54221"; 
    src = super.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "3a542219f3bf129546ae79eb20e384ea28fa9798"; # git rev-parse HEAD
      sha256 = "4z3w6iuv+Gw2xRvhv2AX4suO6dl82woJn0p1nkEx3uM="; # nix-prefetch-url --unpack <url>
    }; 
    patches = []; 
    # Add meta to skip tests if necessary
    meta = with super.lib; {
      isBuildable = true; # Ensure the package is considered buildable
    };
  }); 
}
