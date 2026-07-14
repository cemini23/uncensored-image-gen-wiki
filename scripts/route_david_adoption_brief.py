#!/usr/bin/env python3
"""Mirror David persona adoption briefs to tipdrop-workspace-kit/briefs/.

Canonical during full ingest after writing briefs/YYYY-MM-DD_*-adoption*.md locally.
See wiki/concepts/david-adoption-brief-routing.md and OSINT
scripts/active_project_brief_targets.yaml (david-persona-image-gen).
"""

from __future__ import annotations

import argparse
import re
import shutil
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
BRIEFS_DIR = REPO_ROOT / "briefs"

TIPDROP_CANDIDATES = [
    Path.home() / "Desktop" / "projects" / "tipdrop-workspace-kit",
    REPO_ROOT.parent / "projects" / "tipdrop-workspace-kit",
]


def resolve_tipdrop_kit(create: bool) -> Path:
    for candidate in TIPDROP_CANDIDATES:
        if candidate.is_dir():
            return candidate
    target = TIPDROP_CANDIDATES[0]
    if create:
        target.mkdir(parents=True, exist_ok=True)
        return target
    raise FileNotFoundError(
        "tipdrop-workspace-kit not found. Expected one of:\n"
        + "\n".join(f"  - {p}" for p in TIPDROP_CANDIDATES)
    )


def parse_frontmatter(text: str) -> str | None:
    if not text.startswith("---"):
        return None
    end = text.find("---", 3)
    if end < 0:
        return None
    return text[3:end]


def is_david_adoption(path: Path) -> bool:
    text = path.read_text(encoding="utf-8", errors="replace")
    fm = parse_frontmatter(text)
    if fm is None:
        return False

    if re.search(r"^david:\s*true\s*$", fm, re.M):
        return True

    title_match = re.search(r'^title:\s*"(.*)"\s*$', fm, re.M)
    title = title_match.group(1) if title_match else ""
    if "adoption brief" in title.lower() and "David" in text:
        return True

    if "target: local-app" in fm and (
        "-adoption" in path.stem or "adoption-watch" in path.stem or "adoption" in path.stem
    ):
        return "David" in text

    return False


def dest_name(src: Path) -> str:
    stem = src.stem
    if stem.endswith("-david"):
        return src.name
    return f"{stem}-david.md"


def route_brief(src: Path, kit: Path, dry_run: bool) -> Path | None:
    if not is_david_adoption(src):
        return None

    dest_dir = kit / "briefs"
    dest = dest_dir / dest_name(src)

    if dry_run:
        print(f"DRY RUN: {src.relative_to(REPO_ROOT)} -> {dest}")
        return dest

    dest_dir.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dest)
    print(f"Routed: {src.name} -> {dest}")
    return dest


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "briefs",
        nargs="*",
        help="Specific brief paths (default: scan briefs/ for David adoption briefs)",
    )
    parser.add_argument("--dry-run", action="store_true", help="Print routes without copying")
    parser.add_argument(
        "--no-create-kit",
        action="store_true",
        help="Fail if tipdrop-workspace-kit directory does not exist",
    )
    args = parser.parse_args()

    try:
        kit = resolve_tipdrop_kit(create=not args.no_create_kit)
    except FileNotFoundError as exc:
        print(exc, file=sys.stderr)
        return 1

    if args.briefs:
        sources = [Path(p).resolve() for p in args.briefs]
    else:
        sources = sorted(BRIEFS_DIR.glob("*.md")) if BRIEFS_DIR.is_dir() else []

    routed = 0
    for src in sources:
        if not src.is_file():
            print(f"Skip missing file: {src}", file=sys.stderr)
            continue
        if route_brief(src, kit, args.dry_run):
            routed += 1

    if routed == 0:
        print("No David adoption briefs matched.", file=sys.stderr)
        return 2

    print(f"Done — {routed} brief(s) -> {kit / 'briefs'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
