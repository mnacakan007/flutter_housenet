import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app_router.dart';
import '../../../../providers/app_preferences_provider.dart';
import '../../../widgets/base_container.dart';
import '../../../widgets/portal_master_layout/portal_master_layout.dart';
import '../widgets/settings_toggle_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<AppPreferencesProvider>();
    final currentThemeMode = provider.themeMode;

    return PortalMasterLayout(
      selectedPageIndex: 2,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Dark theme',
              value: currentThemeMode == ThemeMode.dark,
              onChanged: (value) async {
                final themeMode = (currentThemeMode != ThemeMode.dark ? ThemeMode.dark : ThemeMode.light);

                await provider.setThemeModeAsync(themeMode: themeMode);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Notifications',
              value: false,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Allow analytics',
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Clear the history',
              iconData: Icons.delete_sweep_outlined,
              iconColor: Theme.of(context).primaryColor,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Support',
              iconData: Icons.message_outlined,
              onTap: () {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Log out',
              iconData: Icons.logout,
              iconColor: Colors.redAccent,
              onTap: () => GoRouter.of(context).go(RouteUri.logout),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final VoidCallback? onTap;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        child: BaseConatiner(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  iconData,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
