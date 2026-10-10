#!/bin/bash
# Copy the Turbo Pascal extras (unlock screen + panoramic background) into the
# installed theme. Re-run after every theme install/update, which replaces the
# theme directory.
set -euo pipefail

theme=turbo-pascal
theme_dir="${OMARCHY_THEME_DIR:-$HOME/.config/omarchy/themes/$theme}"
src="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -d $theme_dir ]]; then
  echo "Theme not found at $theme_dir — install it first:" >&2
  echo "  omarchy theme install https://github.com/keylimesoda/omarchy-turbo-pascal-theme.git" >&2
  exit 1
fi

# Copy real files (not symlinks): Omarchy refuses a symlinked unlock.png.
install -Dm644 "$src/unlock.png" "$theme_dir/unlock.png"
install -Dm644 "$src/preview-unlock.png" "$theme_dir/preview-unlock.png"
for bg in "$src"/backgrounds/*; do
  install -Dm644 "$bg" "$theme_dir/backgrounds/$(basename -- "$bg")"
done
echo "Extras copied into $theme_dir"

# Apply the unlock screen to the boot/disk-unlock (Plymouth) screen.
# Needs sudo, which omarchy-plymouth-set-by-theme asks for itself.
if [[ ${1:-} != --no-plymouth ]] && command -v omarchy-plymouth-set-by-theme >/dev/null; then
  omarchy-plymouth-set-by-theme "$theme"
fi
