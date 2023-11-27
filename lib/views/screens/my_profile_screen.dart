import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../../constants/dimens.dart';
import '../../generated/l10n.dart';
import '../../providers/app_preferences_provider.dart';
import '../../theme/theme_extensions/app_button_theme.dart';
import '../../theme/theme_extensions/app_color_scheme.dart';
import '../../utils/app_focus_helper.dart';
import '../widgets/card_elements.dart';
import '../widgets/portal_master_layout/portal_master_layout.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();

  Future<bool>? _future;

  Future<bool> _getDataAsync() async {
    await Future.delayed(const Duration(seconds: 1), () {
      _formData..username = 'Admin ABC'
      ..email = 'adminabc@email.com';
    });

    return true;
  }

  void _doSave(BuildContext context) {
    AppFocusHelper.instance.requestUnfocus();

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      final lang = Lang.of(context);

      final dialog = AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        title: lang.recordSavedSuccessfully,
        width: kDialogWidth,
        btnOkText: 'OK',
        btnOkOnPress: () {},
      );

      dialog.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);

    return PortalMasterLayout(
      selectedPageIndex: 1,
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lang.myProfile,
                style: themeData.textTheme.headlineMedium,
              ),
              _toggleThemeButton(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(
                    title: lang.myProfile,
                  ),
                  CardBody(
                    child: FutureBuilder<bool>(
                      future: _future ??= _getDataAsync(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          if (snapshot.hasData && snapshot.data!) {
                            return _content(context);
                          }
                        } else if (snapshot.hasData && snapshot.data!) {
                          return _content(context);
                        }

                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              backgroundColor: themeData.scaffoldBackgroundColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);

    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
            child: Stack(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/app_logo.png'),
                  radius: 60,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: themeData.extension<AppButtonTheme>()!.secondaryElevated.copyWith(
                            shape: MaterialStateProperty.all(const CircleBorder()),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
            child: FormBuilderTextField(
              name: 'username',
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Username',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              initialValue: _formData.username,
              validator: FormBuilderValidators.required(),
              onSaved: (value) => _formData.username = value ?? '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
            child: FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              initialValue: _formData.email,
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.required(),
              onSaved: (value) => _formData.email = value ?? '',
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                style: themeData.extension<AppButtonTheme>()!.successElevated,
                onPressed: () => _doSave(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: kDefaultPadding * 0.5),
                      child: Icon(
                        Icons.save_rounded,
                        size: themeData.textTheme.labelLarge!.fontSize! + 4.0,
                      ),
                    ),
                    Text(lang.save),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleThemeButton(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);
    final isFullWidthButton = MediaQuery.of(context).size.width > kScreenWidthMd;

    return SizedBox(
      width: 48,
      child: TextButton(
        onPressed: () async {
          final provider = context.read<AppPreferencesProvider>();
          final currentThemeMode = provider.themeMode;
          final themeMode = (currentThemeMode != ThemeMode.dark ? ThemeMode.dark : ThemeMode.light);

          await provider.setThemeModeAsync(themeMode: themeMode);
        },
        style: TextButton.styleFrom(
          foregroundColor: themeData.colorScheme.onPrimary,
          disabledForegroundColor: themeData.extension<AppColorScheme>()!.primary.withOpacity(0.38),
          shape: const RoundedRectangleBorder(),
        ),
        child: Selector<AppPreferencesProvider, ThemeMode>(
          selector: (context, provider) => provider.themeMode,
          builder: (context, value, child) {
            var icon = Icons.dark_mode_rounded;
            var text = lang.darkTheme;
            var color = Colors.black;

            if (value == ThemeMode.dark) {
              icon = Icons.light_mode_rounded;
              text = lang.lightTheme;
              color = Colors.white;
            }

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: themeData.textTheme.labelLarge!.fontSize! + 4.0,
                ),
                Visibility(
                  visible: isFullWidthButton,
                  child: Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
                    child: Text(text),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FormData {
  String userProfileImageUrl = '';
  String username = '';
  String email = '';
}
