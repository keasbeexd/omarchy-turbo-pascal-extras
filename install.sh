#!/bin/bash
# Install or update the Turbo Pascal theme with full styling, then add these extras.
#
#   1. omarchy theme install  (fresh clone; replaces the theme folder)
#   2. remove the theme's .git so Omarchy loads its full styling
#   3. copy unlock.png, preview-unlock.png and backgrounds into the theme
#   4. omarchy theme set turbo-pascal
#   5. omarchy-plymouth-set-by-theme turbo-pascal  (asks for sudo)
#
# Options:
#   --extras-only   skip steps 1-2 (just recopy the extras into the current theme)
#   --no-plymouth   skip step 5
set -euo pipefail

theme=turbo-pascal
theme_repo=https://github.com/keylimesoda/omarchy-turbo-pascal-theme.git
theme_dir="$HOME/.config/omarchy/themes/$theme"
src="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

extras_only=false
plymouth=true
for arg in "$@"; do
  case $arg in
    --extras-only) extras_only=true ;;
    --no-plymouth) plymouth=false ;;
    *) echo "Unknown option: $arg" >&2; exit 1 ;;
  esac
done

if (( EUID == 0 )); then
  echo "Run this as your normal user, not with sudo." >&2
  exit 1
fi

if ! $extras_only; then
  omarchy theme install "$theme_repo"
  rm -rf -- "$theme_dir/.git"
fi

if [[ ! -d $theme_dir ]]; then
  echo "Theme not found at $theme_dir" >&2
  exit 1
fi

# Real copies, not symlinks: Omarchy refuses a symlinked unlock.png.
cp -- "$src/unlock.png" "$src/preview-unlock.png" "$theme_dir/"
mkdir -p -- "$theme_dir/backgrounds"
cp -- "$src"/backgrounds/* "$theme_dir/backgrounds/"
echo "Extras copied into $theme_dir"

omarchy theme set "$theme"

if $plymouth; then
  omarchy-plymouth-set-by-theme "$theme"
fi
