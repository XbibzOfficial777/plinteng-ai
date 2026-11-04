import 'package:rive/rive.dart';

import 'mascot_state.dart';

/// Drives the mascot Rive state machine from application state.
///
/// Uses the Rive 0.14 API: [File.asset] + [RiveWidgetController].
/// One instance per mascot. Call [updateState] whenever the real
/// application state changes; it activates the matching state machine
/// inputs and deactivates the rest. Dispose with [dispose].
class RiveMascotController {
  RiveMascotController({String stateMachineName = 'mascot'})
      : _stateMachineName = stateMachineName;

  final String _stateMachineName;

  RiveWidgetController? _controller;
  File? _file;

  /// True when the .riv asset is loaded and the state machine is ready.
  bool get isReady => _controller != null;

  /// The underlying Rive widget controller (null until the asset loads).
  RiveWidgetController? get riveController => _controller;

  Future<void> loadAsset(String assetPath) async {
    final file = await File.asset(assetPath, riveFactory: Factory.rive);
    _file = file;
    _controller = RiveWidgetController(
      file,
      stateMachineSelector: StateMachineSelector.byName(_stateMachineName),
    );
  }

  /// Activate the state matching [state]. Resting states keep the
  /// breathing animation; other states override it.
  void updateState(MascotState state) {
    final controller = _controller;
    if (controller == null) return;
    final sm = controller.stateMachine;

    final resting = state.isResting;

    if (state == MascotState.success) {
      sm.trigger('triggerSuccess');
    }

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

  /// Start advancing the animation.
  void play() => _controller?.active = true;

  /// Stop advancing the animation.
  void stop() => _controller?.active = false;

  void dispose() {
    _controller?.dispose();
    _file?.dispose();
  }
}
