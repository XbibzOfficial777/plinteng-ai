import 'package:flutter_test/flutter_test.dart';
import 'package:plinteng_ai/shared/rive/mascot_state.dart';

void main() {
  test('each state maps to a distinct input name', () {
    final inputs = MascotState.values.map((s) => s.riveInput).toSet();
    expect(inputs.length, MascotState.values.length);
  });

  test('idle and sleeping are resting states', () {
    expect(MascotState.idle.isResting, isTrue);
    expect(MascotState.sleeping.isResting, isTrue);
    expect(MascotState.working.isResting, isFalse);
    expect(MascotState.talking.isResting, isFalse);
  });
}
