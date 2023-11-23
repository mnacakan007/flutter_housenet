import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app_router.dart';
import '../../../constants/dimens.dart';
import '../../../generated/l10n.dart';
import '../../../master_layout_config.dart';
import '../../../providers/app_preferences_provider.dart';
import '../../../store/auth/auth_state.dart';
import '../bottom-nav-bar.dart';

class LocaleMenuConfig {
  final String languageCode;
  final String? scriptCode;
  final String name;

  const LocaleMenuConfig({
    required this.languageCode,
    this.scriptCode,
    required this.name,
  });
}

class PortalMasterLayout extends StatefulWidget {
  final Widget body;
  final bool autoSelectMenu;
  final String? selectedMenuUri;
  final int selectedPageIndex;
  final void Function(bool isOpened)? onDrawerChanged;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;

  const PortalMasterLayout({
    Key? key,
    required this.body,
    this.autoSelectMenu = true,
    this.selectedMenuUri,
    this.selectedPageIndex = 0,
    this.onDrawerChanged,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
  }) : super(key: key);

  @override
  State<PortalMasterLayout> createState() => _PortalMasterLayoutState();
}

class _PortalMasterLayoutState extends State<PortalMasterLayout> {
  final _autState = AuthState();

  @override
  Widget build(BuildContext context) {
    // final mediaQueryData = MediaQuery.of(context);
    // final drawer = (mediaQueryData.size.width <= kScreenWidthLg ? _sidebar(context) : null);
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: (drawer != null),
        title: ResponsiveAppBarTitle(
          onAppBarTitlePressed: () => GoRouter.of(context).go(RouteUri.home),
        ),
        backgroundColor: const Color(0xFFE4003A),
        actions: [
          _changeLanguageButton(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: VerticalDivider(
              width: 1,
              thickness: 1,
              color: themeData.appBarTheme.foregroundColor!.withOpacity(0.5),
              indent: 14,
              endIndent: 14,
            ),
          ),
          IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              tooltip: 'Logout/ExitToApp',
              onPressed: () {
                _autState.logout();
                GoRouter.of(context).go(RouteUri.logout);
              },
          ),
          const SizedBox(width: kDefaultPadding * 0.5),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedPageIndex: widget.selectedPageIndex),
      // drawer: drawer,
      // drawerEnableOpenDragGesture: false,
      // onDrawerChanged: onDrawerChanged,
      // body: _responsiveBody(context),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
    );
  }

  // Widget _responsiveBody(BuildContext context) {
  //   if (MediaQuery.of(context).size.width <= kScreenWidthLg) {
  //     return body;
  //   } else {
  //     return Row(
  //       children: [
  //         SizedBox(
  //           width: Theme.of(context).extension<AppSidebarTheme>()!.sidebarWidth,
  //           child: _sidebar(context),
  //         ),
  //         Expanded(child: body),
  //       ],
  //     );
  //   }
  // }

  Widget _changeLanguageButton(BuildContext context) {
    final themeData = Theme.of(context);

    return PopupMenuButton(
      splashRadius: 0,
      tooltip: '',
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return localeMenuConfigs.map<PopupMenuItem>((e) {
          return PopupMenuItem(
            onTap: () async {
              final provider = context.read<AppPreferencesProvider>();

              await provider.setLocaleAsync(locale: Locale.fromSubtags(languageCode: e.languageCode, scriptCode: e.scriptCode));
            },
            child: Text(e.name),
          );
        }).toList(growable: false);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
        constraints: const BoxConstraints(minWidth: 48),
        child: Row(
          children: [
            Icon(
              Icons.language,
              size: themeData.textTheme.labelLarge!.fontSize! + 4.0,
            ),
            Visibility(
              visible: MediaQuery.of(context).size.width > kScreenWidthMd,
              child: Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
                child: Text(Lang.of(context).language),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveAppBarTitle extends StatelessWidget {
  final void Function() onAppBarTitlePressed;

  const ResponsiveAppBarTitle({
    Key? key,
    required this.onAppBarTitlePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final mediaQueryData = MediaQuery.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onAppBarTitlePressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: mediaQueryData.size.width > kScreenWidthSm,
              child: Container(
                padding: const EdgeInsets.only(right: kDefaultPadding * 0.7),
                height: 40,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(lang.appTitle),
          ],
        ),
      ),
    );
  }
}
