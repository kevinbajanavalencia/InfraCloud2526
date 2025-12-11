#!/usr/bin/env bash
# manage-samplerunning.sh
# Manage samplerunning container: replace, force remove, rename, or run another copy.
# Usage examples:
#   ./manage-samplerunning.sh --replace
#   ./manage-samplerunning.sh --force
#   ./manage-samplerunning.sh --rename samplerunning_old
#   ./manage-samplerunning.sh --new-name samplerunning2
#   ./manage-samplerunning.sh --replace --dry-run

set -euo pipefail

CONTAINER_NAME="samplerunning"
IMAGE_NAME="sampleapp"
HOST_PORT=5055
CONTAINER_PORT=5055

print_help() {
  cat <<EOF
Usage: $0 [options]
Options:
  --replace            Stop and remove existing "$CONTAINER_NAME" (if present), then run new container.
  --force              Force remove existing "$CONTAINER_NAME" (docker rm -f) then run new container.
  --rename NEW_NAME    Rename existing "$CONTAINER_NAME" to NEW_NAME, then run new container.
  --new-name NEW_NAME  Do not touch existing container; run new container with name NEW_NAME.
  --dry-run            Print commands that would run, but do not execute them.
  -h, --help           Show this help and exit.
EOF
}

DRY_RUN=false
MODE=""
ARG=""

# parse args
while (( $# )); do
  case "$1" in
    --replace) MODE="replace"; shift ;;
    --force) MODE="force"; shift ;;
    --rename) MODE="rename"; ARG="${2:-}"; shift 2 ;;
    --new-name) MODE="new-name"; ARG="${2:-}"; shift 2 ;;
    --dry-run) DRY_RUN=true; shift ;;
    -h|--help) print_help; exit 0 ;;
    *) echo "Unknown option: $1"; print_help; exit 1 ;;
  esac
done

if [ -z "$MODE" ]; then
  echo "No action specified."
  print_help
  exit 1
fi
#!/usr/bin/env bash
# manage-samplerunning.sh
# Manage samplerunning container: replace, force remove, rename, or run another copy.
# Usage examples:
#   ./manage-samplerunning.sh --replace
#   ./manage-samplerunning.sh --force
#   ./manage-samplerunning.sh --rename samplerunning_old
#   ./manage-samplerunning.sh --new-name samplerunning2
#   ./manage-samplerunning.sh --replace --dry-run

set -euo pipefail

CONTAINER_NAME="samplerunning"
IMAGE_NAME="sampleapp"
HOST_PORT=5055
CONTAINER_PORT=5055

print_help() {
  cat <<EOF
Usage: $0 [options]
Options:
  --replace            Stop and remove existing "$CONTAINER_NAME" (if present), then run new container.
  --force              Force remove existing "$CONTAINER_NAME" (docker rm -f) then run new container.
  --rename NEW_NAME    Rename existing "$CONTAINER_NAME" to NEW_NAME, then run new container.
  --new-name NEW_NAME  Do not touch existing container; run new container with name NEW_NAME.
  --dry-run            Print commands that would run, but do not execute them.
  -h, --help           Show this help and exit.
EOF
}

DRY_RUN=false
MODE=""
ARG=""

# parse args
while (( $# )); do
  case "$1" in
    --replace) MODE="replace"; shift ;;
    --force) MODE="force"; shift ;;
    --rename) MODE="rename"; ARG="${2:-}"; shift 2 ;;
    --new-name) MODE="new-name"; ARG="${2:-}"; shift 2 ;;
    --dry-run) DRY_RUN=true; shift ;;
    -h|--help) print_help; exit 0 ;;
    *) echo "Unknown option: $1"; print_help; exit 1 ;;
  esac
done

if [ -z "$MODE" ]; then
  echo "No action specified."
  print_help
  exit 1
fi

run() {
  if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] $*"
  else
    echo "[RUN] $*"
    eval "$@"
  fi
}

exists() {
  docker ps -a --format '{{.Names}}' | grep -xq "$1"
}

is_running() {
  docker ps --format '{{.Names}}' | grep -xq "$1"
}

# action handlers
case "$MODE" in
  replace)
    echo "== Replace mode: stop & remove existing \"$CONTAINER_NAME\", then run new container =="
    if exists "$CONTAINER_NAME"; then
      if is_running "$CONTAINER_NAME"; then
        run docker stop "$CONTAINER_NAME"
      fi
      run docker rm "$CONTAINER_NAME"
    else
      echo "No existing container named \"$CONTAINER_NAME\" found."
    fi
    run docker run -t -d -p ${HOST_PORT}:${CONTAINER_PORT} --name "$CONTAINER_NAME" "$IMAGE_NAME"
    ;;

  force)
    echo "== Force-remove mode: docker rm -f \"$CONTAINER_NAME\" then run new container =="
    if exists "$CONTAINER_NAME"; then
      run docker rm -f "$CONTAINER_NAME"
    else
      echo "No existing container named \"$CONTAINER_NAME\" found."
    fi
    run docker run -t -d -p ${HOST_PORT}:${CONTAINER_PORT} --name "$CONTAINER_NAME" "$IMAGE_NAME"
    ;;

  rename)
    if [ -z "$ARG" ]; then
      echo "Error: --rename requires a new name argument."
      exit 1
    fi
    NEWNAME="$ARG"
    echo "== Rename mode: rename \"$CONTAINER_NAME\" -> \"$NEWNAME\" then run new container =="
    if exists "$CONTAINER_NAME"; then
      run docker rename "$CONTAINER_NAME" "$NEWNAME"
    else
      echo "No existing container named \"$CONTAINER_NAME\" found. Skipping rename."
    fi
    run docker run -t -d -p ${HOST_PORT}:${CONTAINER_PORT} --name "$CONTAINER_NAME" "$IMAGE_NAME"
    ;;

  new-name)
    if [ -z "$ARG" ]; then
      echo "Error: --new-name requires a new name argument."
      exit 1
    fi
    NEWNAME="$ARG"
    echo "== Run new container w/ name \"$NEWNAME\" (leave existing container alone) =="
    if exists "$NEWNAME"; then
      echo "Error: a container named \"$NEWNAME\" already exists. Choose another name."
      exit 1
    fi
    run docker run -t -d -p ${HOST_PORT}:${CONTAINER_PORT} --name "$NEWNAME" "$IMAGE_NAME"
    ;;

  *)
    echo "Unknown mode: $MODE"
    exit 1
    ;;
esac

echo "Done."

