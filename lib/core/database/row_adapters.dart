import '../../shared/models/activity.dart' as activity;
import '../../shared/models/agent.dart' as model;

import 'app_database.dart';

/// Converts drift row types to domain model objects.

extension AgentRowExtension on Agent {
  model.Agent toAgent() => model.Agent(
        id: id,
        name: name,
        personality: personality,
        customInstructions: customInstructions ?? '',
        preferredLanguage: preferredLanguage ?? '',
        responseLength: responseLength ?? 'medium',
        formality: formality ?? 'medium',
        humorEnabled: humorEnabled ?? false,
        providerId: providerId ?? '',
        integrationIds: integrationIds ?? '',
        isActive: isActive ?? false,
        createdAt: createdAt ?? DateTime.now(),
        updatedAt: updatedAt ?? DateTime.now(),
      );
}

extension ActivityItemRowExtension on ActivityItem {
  activity.ActivityItem toActivity() => activity.ActivityItem(
        id: id,
        kind: activity.ActivityKind.values.firstWhere((e) => e.name == kind),
        title: title,
        details: details ?? '',
        status:
            activity.ActivityStatus.values.firstWhere((e) => e.name == status),
        createdAt: createdAt ?? DateTime.now(),
      );
}
