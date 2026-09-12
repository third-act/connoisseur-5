# UI KIT — ThirdAct pitch demos

Copy-ready Flutter tokens and shared widgets for sales pitch apps.

## When to copy

1. After **BRIEF** art direction is chosen (brand accent, light/dark commit).
2. Copy into the pitch repo as:
   - `lib/ui/common/` ← `KIT/common/` (theme, colors, space, radius, motion, shadows, haptics)
   - `lib/ui/shared_widgets/` ← `KIT/shared_widgets/`
3. Tint `AppColors.accent` / `accentSoft` to the brand. Keep the **neutral ramp hue-cast consistent** with `bg` (warm with warm, cool with cool).
4. Never leave a pure `#FFFFFF` page background — use `AppColors.bg`.

Import via the barrel after copy, or reference files directly:

```dart
import 'package:your_app/ui/common/app_theme.dart';
```

English only. No Firebase. Widgets are self-contained (`package:flutter/material.dart`).

**STOP:** first compose without `AppSpace.screen` / section padding is cramped — fail `gate.sh`, do not wait for UI review.

**STOP:** `Image.network` / live CMS URLs for seed photos — bundle into `assets/images/`. With ≥4 tabs, use vertical icon-over-label (`TabPill(axis: …)`).

**STOP (Ekerö):** tab roots without bottom inset under floating TabPill; SnapCarousel without shadow clearance above dots; double splash (logo plate / web boot before staged splash).

**STOP:** write CTA that lands momentant on mock/instant seed — use `AppAsync.run` + `AppAsync.spinner` (Cupertino), then `SuccessOverlay`. Material spinner on primary write = STOP.

**STOP (TabPill):** unequal cell widths; inactive outline border; `alignment:` under loose `bottomNavigationBar`. Wrap each pill in `Expanded`. Floating pill + filled active is the hard default.

**STOP (CAIA):** `await AppHaptics.*` / `await HapticFeedback.*` before `onTap`/`onPressed` — use fire-and-forget. Wizard CTA must stay hittable. Product titles in body: maxLines ≥ 3.
