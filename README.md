# Plinteng AI

> Personal AI Agent & Automation Platform for Android.
> Flutter · Kotlin · Rive · Riverpod · GitHub Actions

Plinteng AI combines three product experiences:

1. **Personal AI companion** — an original animated mascot (Rive) that
   expresses the real application state through state machines.
2. **AI automation platform** — real, permission-controlled automations:
   notification reply actions, scheduled tasks, and workflows.
3. **AI provider & integration hub** — OpenAI / Gemini / Anthropic /
   OpenAI-compatible providers, agents, messaging integrations, permissions.

## Status (Phase 1)

- ✅ Project scaffold (Flutter 3.47 + Kotlin + Gradle 9 / AGP 9.1)
- ✅ Feature-first clean architecture skeleton
- ✅ Design token system (light + deliberately designed dark)
- ✅ Navigation shell (Home / Agents / Activity / Settings)
- ✅ Riverpod state management
- ✅ Secure storage + host-allowlist HTTP client
- ✅ Domain models (agents, providers, conversations, automations, activity)
- ✅ Rive integration layer (controller + state mapping) — `.riv` asset pending (Phase 2)
- ✅ GitHub Actions workflow (analyze, test, APK, AAB, signing via secrets)
- ✅ Unit + widget tests
- ⏳ Mascot Rive assets (Phase 2)
- ⏳ Home / agents / chat / providers / integrations (Phase 3)
- ⏳ Notification automation engine (Phase 4)

## Toolchain (pinned)

| Component | Version |
|---|---|
| Flutter | 3.47.7 |
| Dart | 3.13.5 |
| Kotlin | 2.4.0 |
| AGP | 9.1.0 |
| Gradle | 9.3.1 |
| JDK | 17 |
| minSdk / targetSdk | 24 / 36 |

## Architecture

```
lib/
  app/          app.dart, bootstrap.dart, providers/
  router/       routes.dart, app_router.dart
  theme/        app_colors.dart, app_typography.dart, app_theme.dart
  core/         config, constants, errors, networking, security, storage, utilities, widgets
  features/     home, agents, conversations, ai_providers, integrations,
                messaging, automations, tasks, activity, settings
  shared/       models, services, components, rive
  assets/       fonts, images, icons, rive
```

See `docs/ARCHITECTURE.md`.

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

## Build

```bash
flutter build apk --release
flutter build aab --release
```

Release signing is configured exclusively through GitHub Secrets
(`RELEASE_STORE_FILE`, `RELEASE_STORE_PASSWORD`, `RELEASE_KEY_ALIAS`,
`RELEASE_KEY_PASSWORD`). No keys are ever committed.

## CI

GitHub Actions workflow `.github/workflows/android-build.yml`:

- `workflow_dispatch` — manual build with inputs (build mode, format,
  version name, build number)
- push / PR validation — analyze + unit/widget tests
- builds debug APK, release APK, release AAB
- artifact upload + test coverage upload

## Privacy & security

- No developer server. Data stays on device.
- API keys stored in secure storage; never logged.
- HTTP client refuses any host outside the allowlist
  (`api.openai.com`, `api.anthropic.com`, `generativelanguage.googleapis.com`,
  `api.telegram.org`).
- Automatic replies are always user-authorized; emergency global stop.

## License

Private. Do not redistribute.
