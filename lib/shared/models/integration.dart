import 'package:freezed_annotation/freezed_annotation.dart';

part 'integration.freezed.dart';
part 'integration.g.dart';

/// A messaging / external integration.
///
/// Status semantics are explicit: an integration is never shown as
/// connected when it is not.
@freezed
class Integration with _$Integration {
  Integration._({
    required this.id,
    required this.platform,
    required this.displayName,
    this.status,
    this.capabilities,
    this.detail,
    this.createdAt,
  })
      : createdAt = createdAt ?? DateTime.now();

  factory Integration({
    required this.id,
    required this.platform,
    required this.displayName,
    @Default(IntegrationStatus.available) this.status,
    @Default([]) this.capabilities,
    @Default('') this.detail,
    this.createdAt,
  }) = _Integration;

  final String id;
  final IntegrationPlatform platform;
  final String displayName;
  final IntegrationStatus status;
  final List<String> capabilities;
  final String detail; // error message / last check time
  final DateTime createdAt;
}

enum IntegrationPlatform {
  whatsapp,
  whatsappBusiness,
  telegram,
  instagram,
  tiktok,
  messenger,
  notificationSource,
}

enum IntegrationStatus {
  available,
  connected,
  authorized,
  unsupported,
  disconnected,
}
