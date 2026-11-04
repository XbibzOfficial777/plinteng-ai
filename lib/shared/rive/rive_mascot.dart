import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../theme/app_colors.dart';
import 'mascot_state.dart';
import 'rive_mascot_controller.dart';

/// The mascot widget driven by [RiveMascotController].
///
/// If the `.riv` asset is not present yet (Rive editor deliverable), a
/// clear placeholder is shown — no fake animations are ever substituted.
class RiveMascot extends StatefulWidget {
  const RiveMascot({
    super.key,
    this.initialState = MascotState.idle,
    this.width = 200,
    this.height = 200,
    this.assetPath = 'assets/rive/mascot.riv',
  });

  final MascotState initialState;
  final double width;
  final double height;
  final String assetPath;

  @override
  State<RiveMascot> createState() => _RiveMascotState();
}

class _RiveMascotState extends State<RiveMascot> {
  late final RiveMascotController _controller = RiveMascotController();
  bool _assetMissing = false;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      await _controller.loadAsset(widget.assetPath);
      if (!_disposed) {
        _controller.play();
        _controller.updateState(widget.initialState);
      }
    } catch (_) {
      // Asset not yet shipped (documented in assets/rive/README.md).
      // Show a placeholder instead of a fake animation.
      if (!_disposed) setState(() => _assetMissing = true);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_assetMissing) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.smart_toy, size: 64, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              'Mascot (Rive)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Aset .riv hadir di Phase 2',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    }

    final riveController = _controller.riveController;
    if (riveController == null) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RiveWidget(controller: riveController),
    );
  }
}
