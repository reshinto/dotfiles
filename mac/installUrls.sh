#!/bin/sh
# chmod a+x installUrls.sh

set -euo pipefail

# Download Apps via urls
downloadurls() {
  # Usage: download OUTDIR URL1 URL2 ...
  export OUTDIR="$1"
  shift
  local JOBS="${JOBS:-4}"

  # Print URLs being downloaded
  echo "Downloading (${#@}) URL(s):"
  for u in "$@"; do
    echo "  - $u"
  done

  run_downloads() {
    printf '%s\0' "$@" | xargs -0 -n 1 -P "$JOBS" bash -c '
      set -euo pipefail
      url="$1"
      outdir="${OUTDIR%/}"

      rawname="$(basename "${url%%\?*}")"

      # If URL has extension, save directly
      if [[ "$rawname" == *.* ]]; then
        /usr/bin/curl --fail --location --retry 3 --retry-delay 2 \
          --silent --show-error \
          -o "$outdir/$rawname" \
          "$url"
        exit 0
      fi

      # No extension: download to temp, infer name from final redirected URL
      tmpfile="$(mktemp "$outdir/download.XXXXXX")"
      effective_url="$(
        /usr/bin/curl --fail --location --retry 3 --retry-delay 2 \
          --silent --show-error \
          -o "$tmpfile" \
          -w "%{url_effective}" \
          "$url"
      )"

      base="${effective_url%%\?*}"
      filename="$(basename "$base")"

      # If still generic/empty, fall back
      lower="$(printf "%s" "$filename" | tr "[:upper:]" "[:lower:]")"
      if [[ -z "$filename" || "$lower" == "fwlink" || "$lower" == "download" || "$lower" == "index" || "$lower" == "file" || "$lower" == "get" ]]; then
        host="$(printf "%s" "$effective_url" | awk -F/ "{print \$3}")"
        filename="${host:-downloaded_file}"
      fi

      filename="${filename// /_}"
      final="$outdir/$filename"
      mv -f "$tmpfile" "$final"

      # If still no extension, add .pkg when it’s a signed installer package
      if [[ "$filename" != *.* ]]; then
        if /usr/sbin/pkgutil --check-signature "$final" >/dev/null 2>&1; then
          mv -f "$final" "${final}.pkg"
        fi
      fi
    ' _
  }

  # Run downloads in background
  run_downloads "$@" &
  local pid=$!

  # Spinner while background job runs (macOS bash 3.2 compatible)
  local spin='-\|/'
  local i=0
  while kill -0 "$pid" 2>/dev/null; do
    i=$(( (i + 1) % 4 ))
    printf "\r... %c" "${spin:$i:1}"
    /bin/sleep 0.1
  done

  # Collect exit status
  wait "$pid"
  printf "\rDownloading... done\n"
}

# Update Urls here
urls=(
  "https://admin.stimulsoft.com/install/Stimulsoft-Designer-2026.1.2.dmg"
  "https://go.microsoft.com/fwlink/?linkid=2325438&clcid=0x409&culture=en-us&country=us"
)

downloadurls "$HOME/Downloads" "${urls[@]}"
