#!/bin/bash
#
# run-cfn-lint.sh — Validate CloudFormation templates using cfn-lint
#
# Usage:
#   ./scripts/run-cfn-lint.sh                          # lint all templates in cloudformation/
#   ./scripts/run-cfn-lint.sh cloudformation/iam.yaml  # lint a specific file
#   ./scripts/run-cfn-lint.sh path/to/dir/             # lint all templates in a directory
#
# Exit codes:
#   0 — all templates passed
#   1 — one or more templates have errors
#   2 — script misconfiguration (missing venv, no templates found, etc.)

set -euo pipefail

# -------------------------------------------------------------------
# Configuration — adapt these to each repository
# -------------------------------------------------------------------
DEFAULT_TEMPLATE_DIR="cloudformation"
VENV_DIR=".venv"

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------
info()  { echo "ℹ  $*"; }
ok()    { echo "✓  $*"; }
fail()  { echo "✗  $*" >&2; }

# -------------------------------------------------------------------
# Pre-flight checks
# -------------------------------------------------------------------
if [ ! -d "$VENV_DIR" ]; then
    fail "Virtual environment not found at $VENV_DIR"
    fail "Create one first: python -m venv $VENV_DIR"
    exit 2
fi

# Activate the virtual environment
# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

# Ensure cfn-lint is installed
if ! command -v cfn-lint &>/dev/null; then
    fail "cfn-lint is not installed in the virtual environment"
    fail "Install it: source $VENV_DIR/bin/activate && pip install cfn-lint"
    exit 2
fi

# -------------------------------------------------------------------
# Resolve target (file or directory)
# -------------------------------------------------------------------
TARGET="${1:-$DEFAULT_TEMPLATE_DIR}"

if [ -f "$TARGET" ]; then
    TEMPLATES=("$TARGET")
elif [ -d "$TARGET" ]; then
    # Collect .yaml, .yml, and .json files
    TEMPLATES=()
    while IFS= read -r -d '' f; do
        TEMPLATES+=("$f")
    done < <(find "$TARGET" -type f \( -name '*.yaml' -o -name '*.yml' -o -name '*.json' \) -print0 | sort -z)
else
    fail "Target not found: $TARGET"
    exit 2
fi

if [ ${#TEMPLATES[@]} -eq 0 ]; then
    fail "No CloudFormation templates found in $TARGET"
    exit 2
fi

info "Found ${#TEMPLATES[@]} template(s) to validate"

# -------------------------------------------------------------------
# Run cfn-lint
# -------------------------------------------------------------------
ERRORS=0

for tmpl in "${TEMPLATES[@]}"; do
    info "Linting $tmpl"
    if cfn-lint "$tmpl"; then
        ok "$tmpl passed"
    else
        fail "$tmpl has errors"
        ERRORS=$((ERRORS + 1))
    fi
done

# -------------------------------------------------------------------
# Summary
# -------------------------------------------------------------------
echo ""
if [ "$ERRORS" -gt 0 ]; then
    fail "$ERRORS of ${#TEMPLATES[@]} template(s) failed validation"
    exit 1
else
    ok "All ${#TEMPLATES[@]} template(s) passed validation"
    exit 0
fi
