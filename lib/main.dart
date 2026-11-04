import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Bootstrap the application: seed design tokens, register providers,
  // and initialize secure storage before the UI is built.
  await bootstrap();

  runApp(const ProviderScope(child: PlintengApp()));
}
