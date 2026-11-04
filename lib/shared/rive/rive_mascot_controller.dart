import 'package:rive/rive.dart';

import 'mascot_state.dart';

/// Drives the mascot Rive state machine from application state.
///
/// Extends [RiveController] so it can be passed straight to [RiveWidget].
/// One instance per mascot. Call [updateState] whenever the real
/// application state changes; it activates the matching state machine
/// inputs and deactivates the rest. Dispose with [dispose].
class RiveMascotController extends RiveController {
  RiveMascotController({String stateMachineName = 'mascot'})
      : _stateMachineName = stateMachineName;

  final String _stateMachineName;

  /// True when the .riv asset is loaded and the state machine is ready.
  bool get isReady => smController != null;

  Future<void> loadAsset(String assetPath) async {
    final file = RiveFile.asset(assetPath);
    file = file;
    final artboard = file.artboards.first;
    this.artboard = artboard;
    smController = StateMachineController(artboard, _stateMachineName);
  }

  /// Activate the state matching [state]. Resting states keep the
  /// breathing animation; other states override it.
  void updateState(MascotState state) {
    final sm = smController;
    if (sm == null) return;

    final resting = state.isResting;

    for (final input in <String>[
      'isIdle',
      'isThinking',
      'isListening',
      'isTalking',
      'isWorking',
      'isSleeping',
      'isError',
    ]) {
      final isActive = input == state.riveInput && !resting;
      sm.input<bool>(input)?.value = isActive;
    }

    if (resting) {
      sm.input<bool>('isIdle')?.value = state == MascotState.idle;
      sm.input<bool>('isSleeping')?.value = state == MascotState.sleeping;
    }
  }

  /// Trigger a discrete success reaction.
  void triggerSuccess() {
    smController?.trigger('triggerSuccess');
  }
}
