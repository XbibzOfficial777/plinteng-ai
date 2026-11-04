import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plinteng_ai/shared/components/empty_state.dart';
import 'package:plinteng_ai/shared/components/loading_state.dart';
import 'package:plinteng_ai/shared/components/error_state.dart';
import 'package:plinteng_ai/shared/components/segmented_control.dart';
import 'package:plinteng_ai/shared/components/switch_row.dart';

void main() {
  testWidgets('EmptyState shows title and description', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: EmptyState(icon: Icons.inbox, title: 'Belum ada aktivitas')),
    ));
    expect(find.text('Belum ada aktivitas'), findsOneWidget);
    expect(find.text('+ Tambah'), findsNothing);
  });

  testWidgets('LoadingState shows spinner label', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: LoadingState(label: 'Memuat…')),
    ));
    expect(find.text('Memuat…'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('ErrorState shows title and retry', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: ErrorState(title: 'Gagal', description: 'Coba lagi')),
    ));
    expect(find.text('Gagal'), findsOneWidget);
    expect(find.text('Coba lagi'), findsOneWidget);
  });

  testWidgets('SegmentedControl highlights the selected option', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SegmentedControl<String>(
          options: [
            (icon: null, label: 'Linca', value: 'linca'),
            (icon: null, label: 'CS', value: 'cs'),
          ],
          selected: 'linca',
          onSelected: (_) {},
        ),
      ),
    ));
    expect(find.text('Linca'), findsOneWidget);
    expect(find.text('CS'), findsOneWidget);
  });

  testWidgets('SwitchRow renders switch with value', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SwitchRow(icon: Icons.autorenew, title: 'Balasan otomatis', value: true, onChanged: (_) {}),
      ),
    ));
    expect(find.text('Balasan otomatis'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
  });
}
