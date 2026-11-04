import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import 'app.dart';
import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Rive runtime must be initialized before any Rive asset is loaded.
  RiveNative.init();

  // Bootstrap the application: seed design tokens, register providers,
  // and initialize secure storage before the UI is built.
  await bootstrap();

  runApp(const ProviderScope(child: PlintengApp()));
}
