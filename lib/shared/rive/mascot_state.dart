/// Mascot states — each maps to one Rive state machine input.
///
/// The mascot must reflect REAL application state. Never show a working
/// animation when no task is running; never show talking when idle.
enum MascotState {
  idle,
  thinking,
  listening,
  talking,
  working,
  success,
  error,
  sleeping,
}

extension MascotStateX on MascotState {
  /// The primary state machine input to activate for this state.
  String get riveInput => switch (this) {
        MascotState.idle => 'isIdle',
        MascotState.thinking => 'isThinking',
        MascotState.listening => 'isListening',
        MascotState.talking => 'isTalking',
        MascotState.working => 'isWorking',
        MascotState.success => 'isSuccess',
        MascotState.error => 'isError',
        MascotState.sleeping => 'isSleeping',
      };

  /// Whether the state should be the resting animation (idle or sleeping).
  bool get isResting => this == MascotState.idle || this == MascotState.sleeping;
}
