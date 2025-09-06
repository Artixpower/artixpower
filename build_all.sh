#!/usr/bin/env bash
# Build every package subdirectory with makepkg and log success/failure.

set -u
set -o pipefail

ROOT="$(pwd)"
LOGDIR="$ROOT/build-logs"
COMPLETED="$ROOT/completed.txt"
FAILED="$ROOT/failed.txt"

mkdir -p "$LOGDIR"

# Start fresh result files
: > "$COMPLETED"
: > "$FAILED"

shopt -s nullglob

for dir in */ ; do
  # Skip non-directories just in case
  [ -d "$dir" ] || continue

  pkg="${dir%/}"

  # Require a PKGBUILD
  if [[ ! -f "$dir/PKGBUILD" ]]; then
    echo "$(date -Is)  $pkg  (no PKGBUILD)" | tee -a "$FAILED"
    continue
  fi

  echo "==> Building $pkg"
  log="$LOGDIR/$pkg.$(date +%Y%m%d-%H%M%S).log"

  pushd "$dir" >/dev/null

  # Run makepkg, tee output to log, and capture makepkg's true exit code
  (
    set -o pipefail
    makepkg -f --skippgpcheck --nocheck |& tee "$log"
    exit "${PIPESTATUS[0]}"
  )
  status=$?

  popd >/dev/null

  if [[ $status -eq 0 ]]; then
    echo "$(date -Is)  $pkg" | tee -a "$COMPLETED"
  else
    echo "$(date -Is)  $pkg  (exit $status)  log: $log" | tee -a "$FAILED"
  fi
done

echo
echo "Build run complete."
echo "Completed: $(wc -l < "$COMPLETED")"
echo "Failed:    $(wc -l < "$FAILED")"
echo "Logs in:   $LOGDIR"
