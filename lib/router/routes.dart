/// Centralized route definitions for Plinteng AI.
///
/// Navigation hierarchy is deliberately shallow: a 4-destination shell
/// (Home / Agents / Activity / Settings) with feature screens pushed on
/// top. No dead destinations are ever registered.
abstract final class AppRoutes {
  const AppRoutes._();

  // ---- Shell (bottom navigation) ----
  static const String home = '/';
  static const String agents = '/agents';
  static const String activity = '/activity';
  static const String settings = '/settings';

  // ---- Home ----
  static const String conversation = '/conversations';
  static const String conversationForAgent = '/conversations/agent';

  // ---- Agents ----
  static const String agentDetail = '/agents/:agentId';
  static const String agentCreate = '/agents/new';
  static const String agentEdit = '/agents/:agentId/edit';
  static const String agentPersonality = '/agents/:agentId/personality';
  static const String agentProviders = '/agents/:agentId/providers';
  static const String agentIntegrations = '/agents/:agentId/integrations';
  static const String agentPermissions = '/agents/:agentId/permissions';

  // ---- AI providers ----
  static const String providers = '/providers';
  static const String providerEdit = '/providers/:providerId';

  // ---- Integrations ----
  static const String integrations = '/integrations';
  static const String integrationDetail = '/integrations/:platform';

  // ---- Automations ----
  static const String automations = '/automations';
  static const String automationEdit = '/automations/:ruleId';
  static const String automationCreate = '/automations/new';

  // ---- Tasks ----
  static const String tasks = '/tasks';
  static const String taskDetail = '/tasks/:taskId';

  // ---- Messaging ----
  static const String messaging = '/messaging';
  static const String messagingAutoReply = '/messaging/auto-reply';
  static const String messagingQuietHours = '/messaging/quiet-hours';

  // ---- Activity ----
  static const String activityDetail = '/activity/:activityId';

  // ---- Settings ----
  static const String settingsAi = '/settings/ai';
  static const String settingsMessaging = '/settings/messaging';
  static const String settingsPermissions = '/settings/permissions';
  static const String settingsPrivacy = '/settings/privacy';
  static const String settingsAbout = '/settings/about';
}

/// Bottom navigation destinations. Keep deliberate — max 4.
enum class ShellDestination { home, agents, activity, settings }
