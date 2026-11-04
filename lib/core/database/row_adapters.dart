import '../../shared/models/activity.dart';
import '../../shared/models/agent.dart';

import 'app_database.dart';

/// Converts drift row types to domain model objects.

extension AgentsRowExtension on AgentsRow {
  Agent toAgent() => Agent(
        id: id,
        name: name,
        personality: personality,
        customInstructions: customInstructions,
        preferredLanguage: preferredLanguage,
        responseLength: responseLength,
        formality: formality,
        humorEnabled: humorEnabled,
        providerId: providerId,
        integrationIds: integrationIds,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension ActivityItemsRowExtension on ActivityItemsRow {
  ActivityItem toActivity() => ActivityItem(
        id: id,
        kind: ActivityKind.values.firstWhere((e) => e.name == kind),
        title: title,
        details: details,
        status:
            ActivityStatus.values.firstWhere((e) => e.name == status),
        createdAt: createdAt,
      );
}
