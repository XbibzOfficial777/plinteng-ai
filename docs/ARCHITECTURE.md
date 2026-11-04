# Architecture — Plinteng AI

## Layers

1. **Presentation** (`features/<feature>/presentation/`) — widgets, screens,
   Riverpod consumers. No business logic in widgets.
2. **Domain** (`features/<feature>/domain/`) — entities, use cases,
   repositories interfaces. Pure Dart, fully testable.
3. **Data** (`features/<feature>/data/`) — repository implementations,
   API clients, database DAOs. Depends on domain interfaces.
4. **Shared** (`shared/`) — cross-feature models, services, components,
   Rive integration.
5. **Core** (`core/`) — config, constants, errors, networking, security,
   storage, utilities, base widgets.

## State management (Riverpod)

- Feature-specific providers. No global state for unrelated features.
- Immutable state; targeted updates only.
- `AsyncNotifier` for async flows; `StateNotifier` for toggles.

## Navigation (go_router)

- Shell with 4 deliberate destinations: Home, Agents, Activity, Settings.
- Feature screens pushed above the shell. Routes centralized in
  `lib/router/routes.dart`. No dead destinations.

## Rive

- `lib/shared/rive/mascot_state.dart` — state enum ↔ input names.
- `lib/shared/rive/rive_mascot_controller.dart` — drives the state machine
  from real app state.
- `lib/shared/rive/rive_mascot.dart` — widget; placeholder shown until the
  `.riv` asset ships (documented in `assets/rive/README.md`).
- One controller per mascot; disposed on widget dispose.

## Networking

- `AppHttpClient` (Dio) with host allowlist interceptor — refuses any host
  outside `AppConfig.allowedHosts` before data is sent.
- Safe logging: method/host/path only, never bodies.

## Security

- Credentials in `flutter_secure_storage` (Android Keystore).
- Never in logs, analytics, crash reports, git history.
- Release signing via CI secrets only.

## Testing

- Unit: tokens, state mapping, models.
- Widget: app smoke, navigation shell, mascot placeholder.
- Integration (Phase 4): notification listener, reply actions, RemoteInput.

## Phases

See `CLAUDE.md` (master spec): Phase 1 foundation (this repo state),
Phase 2 design system + Rive, Phase 3 core product, Phase 4 automation
engine, Phase 5 performance & security, Phase 6 CI/CD.
