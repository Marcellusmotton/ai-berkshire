#!/bin/bash
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# tools/financial_rigor.py (the tool skills call for PE/ROE calculations) is
# stdlib-only and needs no setup. tools/xueqiu_scraper.py is the one script
# with an external dependency: Playwright. Pin 1.56.0, the release whose
# bundled Chromium build (1194) matches the browser already cached in this
# image at $PLAYWRIGHT_BROWSERS_PATH — this avoids triggering a fresh
# `playwright install` download.
python3 -m pip install --user "playwright==1.56.0"
