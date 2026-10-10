# Turbo Pascal Theme Extras for Omarchy

Two add-ons for [keylimesoda/omarchy-turbo-pascal-theme](https://github.com/keylimesoda/omarchy-turbo-pascal-theme):

- **Unlock screen** – `unlock.png` (and its `preview-unlock.png`), used by Omarchy
  for the Plymouth boot / disk-unlock screen.
- **Panoramic background** – `backgrounds/19-panorama-night.png` (4520×1920) for
  ultrawide / panoramic monitors.

![Unlock screen preview](preview-unlock.png)

## Install / reapply after a theme update

Run this whenever the Turbo Pascal theme is installed or updated. It downloads
this repo to a temporary folder, copies the extras into the theme folder, and
cleans up:

```bash
tmp=$(mktemp -d) && git clone --depth 1 https://github.com/keasbeexd/omarchy-turbo-pascal-extras.git "$tmp" && cp -r "$tmp"/unlock.png "$tmp"/preview-unlock.png "$tmp"/backgrounds ~/.config/omarchy/themes/turbo-pascal/ && rm -rf "$tmp"
```

Then apply the unlock screen to the boot screen (asks for your sudo password;
run it as your normal user, not with `sudo`):

```bash
omarchy-plymouth-set-by-theme turbo-pascal
```

Typical update flow:

```bash
omarchy theme update
# rerun the extras command above
omarchy-plymouth-set-by-theme turbo-pascal
```

## Where the files go

| File in this repo | Destination |
|---|---|
| `unlock.png` | `~/.config/omarchy/themes/turbo-pascal/unlock.png` |
| `preview-unlock.png` | `~/.config/omarchy/themes/turbo-pascal/preview-unlock.png` |
| `backgrounds/19-panorama-night.png` | `~/.config/omarchy/themes/turbo-pascal/backgrounds/` |

Files are copied rather than symlinked, because Omarchy refuses a symlinked
`unlock.png`.

## Using the panoramic background

Cycle to it with:

```bash
omarchy theme bg next
```
