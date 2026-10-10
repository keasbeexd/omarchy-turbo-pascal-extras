# Turbo Pascal Theme Extras for Omarchy

Two add-ons for [keylimesoda/omarchy-turbo-pascal-theme](https://github.com/keylimesoda/omarchy-turbo-pascal-theme):

- **Unlock screen** – `unlock.png` (and its `preview-unlock.png`), used by Omarchy
  for the Plymouth boot / disk-unlock screen.
- **Panoramic background** – `backgrounds/19-panorama-night.png` (4520×1920) for
  ultrawide / panoramic monitors.

![Unlock screen preview](preview-unlock.png)

## Where the files go

| File in this repo | Destination |
|---|---|
| `unlock.png` | `~/.config/omarchy/themes/turbo-pascal/unlock.png` |
| `preview-unlock.png` | `~/.config/omarchy/themes/turbo-pascal/preview-unlock.png` |
| `backgrounds/19-panorama-night.png` | `~/.config/omarchy/themes/turbo-pascal/backgrounds/` |

## Install / reload after a theme update

`omarchy theme install` replaces the whole theme directory, so the extras are
wiped every time you update the theme. Run this afterwards to put them back —
it clones this repo (or pulls the latest if already cloned) and copies the files in:

```bash
EXTRAS="$HOME/.local/share/omarchy-turbo-pascal-extras"
if [[ -d $EXTRAS/.git ]]; then
  git -C "$EXTRAS" pull --ff-only
else
  git clone https://github.com/keasbeexd/omarchy-turbo-pascal-extras.git "$EXTRAS"
fi
"$EXTRAS/install.sh"
```

The clone is kept outside the theme folder on purpose, so a theme update can't
delete it. Run it as your normal user (not with `sudo`).

`install.sh` does the following:

1. Copies `unlock.png`, `preview-unlock.png` and the backgrounds into
   `~/.config/omarchy/themes/turbo-pascal/`. Files are copied rather than
   symlinked, because Omarchy refuses a symlinked `unlock.png`.
2. Runs `omarchy-plymouth-set-by-theme turbo-pascal` to apply the unlock screen.
   This prompts for your sudo password. Skip it with `install.sh --no-plymouth`.

Set `OMARCHY_THEME_DIR` to install into a different theme directory.

### Handy shortcut

Add this to `~/.bashrc` to make reloading a single command:

```bash
tp-extras() {
  local extras="$HOME/.local/share/omarchy-turbo-pascal-extras"
  if [[ -d $extras/.git ]]; then
    git -C "$extras" pull --ff-only || return
  else
    git clone https://github.com/keasbeexd/omarchy-turbo-pascal-extras.git "$extras" || return
  fi
  "$extras/install.sh" "$@"
}
```

Typical update flow:

```bash
omarchy theme install https://github.com/keylimesoda/omarchy-turbo-pascal-theme.git
tp-extras
omarchy theme set turbo-pascal
```

## Using the panoramic background

After installing, cycle to it with:

```bash
omarchy theme bg next
```
