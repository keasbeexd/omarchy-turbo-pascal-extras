# Security policy

## Reporting a vulnerability

Please report privately, not in a public issue or pull request:

- Use GitHub's **Report a vulnerability** button on the Security tab of
  this repository (private vulnerability reporting):
  https://github.com/keasbeexd/omarchy-turbo-pascal-extras/security/advisories/new

Include what you found, how to reproduce it, and which commit you tested. A
proof of concept helps; please test only on your own machine.

You can expect an acknowledgement within a week. Fixes for confirmed issues
are released as soon as they are ready, with an advisory that credits you
unless you ask not to be named.

## What counts

This repository holds images and an `install.sh` that installs the Turbo
Pascal theme and asks for your sudo password once, to set the boot screen.
Examples of what we want to hear about:

- anything `install.sh` does as root beyond setting the Plymouth boot
  screen, or anything it runs that it did not fetch from the repositories
  it names;
- a way for a file in this repository or the theme to make `install.sh`
  run unexpected commands.

Problems in the theme itself belong to
[keylimesoda/omarchy-turbo-pascal-theme](https://github.com/keylimesoda/omarchy-turbo-pascal-theme),
and problems in Omarchy's own commands to Omarchy.

## Supported versions

Only the latest commit on the default branch is supported: the install
command in the README always clones it.
