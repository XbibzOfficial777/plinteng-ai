import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plinteng_ai/app.dart';

void main() {
  testWidgets('app launches with bottom navigation shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: PlintengApp()));
    // pumpAndSettle hangs on continuous animations (Rive progress, shell).
    // Use bounded pumps instead.
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 200));

    // Home is the initial screen.
    expect(find.text('Plinteng AI'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Agents'), findsAtLeastNWidgets(1));
    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('mascot placeholder is shown before Rive asset', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: PlintengApp()));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Mascot (Rive)'), findsOneWidget);
    expect(find.text('Aset .riv hadir di Phase 2'), findsOneWidget);
  });
}
