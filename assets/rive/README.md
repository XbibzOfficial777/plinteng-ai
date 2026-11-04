# Rive assets — Plinteng AI mascot

> ⚠️ **Status: deliverable pending (documented per CLAUDE.md §4.5).**
> No `.riv` files are fabricated. This directory will contain the original
> mascot `.riv` files exported from the Rive editor. Until then, the
> integration layer (`lib/shared/rive/`) and the art/state-machine
> specification below define exactly what the assets must contain.

## Mascot art direction

- Original character: a warm, friendly, rounded "spark" robot —
  recognizable silhouette, expressive eyes, consistent proportions.
- Palette: warm ivory body, coral/orange accents, warm charcoal details
  (see `lib/theme/app_colors.dart`).
- Organized into independently animatable elements: head, eyes (left/right),
  mouth/eyebrows, body, arms, antenna/light, tail/aura.
- Reference illustration: `assets/images/mascot_reference.png` (static
  rendition — the Rive editor builds the animated version from it).

## State machine specification

One main artboard with a single State Machine. Inputs:

| Input | Behavior |
|---|---|
| `isIdle` | breathing + subtle floating (always on) |
| `isBlinking` | eyelid blink loop |
| `isThinking` | gentle movement, eyes looking up |
| `isListening` | attentive, eyes on speaker |
| `isTalking` | mouth animates, subtle head bob |
| `isWorking` | focused, subtle busy movement |
| `isSleeping` | relaxed, eyes closed, slow breathing |
| `isError` | subtle shake + worried expression |
| `triggerSuccess` | discrete celebratory reaction (trigger) |

Behavior mapping (application state → Rive):

| App state | Rive behavior |
|---|---|
| Idle | natural breathing + subtle floating |
| Thinking | thinking expression + gentle movement |
| Listening | attentive expression |
| Talking | appropriate speaking animation |
| Working | focused working animation |
| Success | positive reaction (trigger) |
| Error | subtle error expression |
| Sleeping | relaxed sleeping animation |

Never show working animation when no task is running. Never show talking
when idle. State changes must be bound to actual application state.

## Artboard structure (for the Rive artist)

- Artboard name: `mascot` (512×512 viewport, `hq` render mode)
- Nested groups (each independently animatable):
  - `head` (contains `eyes`, `brows`, `mouth`)
  - `body`
  - `arms` (`arm_left`, `arm_right`)
  - `antenna` (with `antenna_light` glow)
- Boolean inputs named exactly as above; one trigger input `triggerSuccess`.
- Bone/node names: stable, lowercase snake_case.

## Deliverables checklist

- [ ] `mascot.riv` — main artboard + state machine
- [ ] optimized (≤ 2 MB), correct 512 viewport, `hq` render mode for Android
- [ ] inputs named exactly as above
- [ ] runtime verified in the app (controller disposal, no rebuild recreation)

## Integration (already implemented)

- `lib/shared/rive/mascot_state.dart` — state ↔ input names
- `lib/shared/rive/rive_mascot_controller.dart` — drives the state machine
- `lib/shared/rive/rive_mascot.dart` — widget (placeholder until asset ships)
- Home screen mounts the mascot and binds real app state to it.
