# VHS demo tape for greybeard
# Run: vhs demo.tape

Output demo.gif

Set Shell "zsh"
Set FontSize 15
Set Width 1200
Set Height 700
Set Padding 20
Set Theme "Catppuccin Mocha"
Set TypingSpeed 50ms

# Show the help
Type "greybeard --help"
Enter
Sleep 4s

# List available packs
Type "greybeard packs"
Enter
Sleep 6s

# Self-check: the hero demo — reviews your own architectural decision
Type `greybeard self-check --context "We're adding a new database table per tenant for isolation"`
Enter
Sleep 20s

# Done
Sleep 2s
