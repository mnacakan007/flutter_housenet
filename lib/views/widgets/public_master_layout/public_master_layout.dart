import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/dimens.dart';
import '../../../generated/l10n.dart';
import '../../../master_layout_config.dart';
import '../../../providers/app_preferences_provider.dart';

class PublicMasterLayout extends StatelessWidget {
  final Widget body;

  const PublicMasterLayout({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: themeData.scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          _changeLanguageButton(context),
          const SizedBox(width: kDefaultPadding * 0.5),
        ],
      ),
      body: body,
    );
  }

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
              color: themeData.appBarTheme.backgroundColor,
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
