# BRIEF — Connoisseur Club (connoisseur-5)

Draft for Demo QA port. Research date: **12 September 2026**. English (skills). App UI: **Swedish**.

**Build gate:** OPEN — Norway Scout **kjør** 12 Sep 2026 (Composer Max bakeoff). Not full Mail2.

**Track:** **design-bakeoff / Cursor-only**. **Composer Max** on all design steps. Soft depth (brand is light paper + gold — not a fully dark app). Gold densitet bar: **caiacosmetics-4**. Splash + 3–5 tab roots; mock OK. No Opus. No Mail 1/2.

**New project.** Slug `connoisseur-5`, repo `third-act/connoisseur-5`. Do **not** reuse `connoisseur` / `-2` / `-3` / `-4` code, seed, photos, or URLs. QA: https://www.thirdact.no/demo/connoisseur-5 (no `?v=` on Webflow). Customer: https://www.thirdact.se/connoisseur-5. Skills pin: `31ea1b2` (PR #29 face≠flatlay + postage-stamp; densitet; Composer Max).

Never contact studio (`info@connoisseurint.se` / `info@cclub.se`). Never put those or Scout contacts in UI.

---

## 0. HARD REQUIREMENT — onske (verbatim)

Confirmed character-for-character with Norway Scout **12 Sep 2026** (88 chars):

> **En marknadsplats där Connoisseurs användare kan köpa och sälja lyxvaror mellan varandra.**

Must ship visually: member↔member marketplace for luxury goods (browse, listing detail, list-for-sale mock) **plus** club surfaces (events / offers). Do not paraphrase into partner offers or a Connoisseur-run shop. Partner offers ≠ P2P marknad. Swedish UI. Never dump raw onske as a labeled Hem section.

---

## 1. Client

| | |
|---|---|
| Name | Connoisseur International AB |
| Org | 556667-1037 |
| Site | https://www.connoisseurint.se/ |
| Club | https://www.cclub.se/ (do not scrape behind login) |
| Audience | **KUNDE** — Club member (closed HNWI club) |
| Slug | connoisseur-5 |
| Market | **SE** |
| QA | https://www.thirdact.no/demo/connoisseur-5 |
| Customer URL | https://www.thirdact.se/connoisseur-5 |

**Brand (light paper + gold):** accent `#A7945D` / CTA gold `#d28e3d`, cream `#EAE6DC`, white `#FFFFFF`, ink `#000000`, body `#777777`. Wordmark CONNOISSEUR (heavy sans) + Palatino/Book Antiqua for editorial. Tagline: *If it´s not millionaire – it´s not Connoisseur.* Tone: exclusive, discreet. Ignore Elementor kit blues/greens.

**Harvest:** magazine covers, Motordag/event lifestyle, cars/boats/watches/travel editorial — bundle assets only.

---

## 2. Audience

Logged-in Club member (mock). Income-gated closed club (~2,8 Mkr). Free membership. Interests: travel, cars, watches, boats, wine — natural P2P luxury categories.

---

## 2c. Art direction

Soft depth **LOCKED** (cream/white paper, gold accent, soft shadows — matches live site chrome; Soft depth ≠ sparse).

---

## 5. Job flows (visual)

**A.** Marknad browse → listing detail → (mock) interest / buy  
**B.** List something for sale (mock wizard / sheet)  
Club: Event list + Erbjudanden (partner offers) as supporting — not a substitute for §0.

---

## 6. Features (design-bakeoff — thin)

**Tabs (4):** Marknad · Event · Erbjudanden · Klubb  
Signature: **Marknad** (P2P marketplace — onske).

**Must follow tip `31ea1b2`:**
- Densitet: first fold hero + CTA + ≥1 secondary row vs caiacosmetics-4
- Imagery roles correct; product/listing tiles: no postage-stamp white plate in tinted well (same radius / edge-to-edge); match/meta inside card
- face/scan STOP only if a scan surface appears (this brief has none — skip)
- No accent panel under TabPill; no zero-gap stacked cards; AppShadows; break-the-stack once per screen
- Splash harvest photo; first paint not black frame

**§6e:** Soft depth. One accent-owned surface on one screen (prefer Marknad). Bar: caiacosmetics-4.

---

## Screens

marknad feed · listing detail · list-for-sale · event list · erbjudanden · klubb/profil

Splash → logged-in. No login / Firebase / Azure / TestFlight.
