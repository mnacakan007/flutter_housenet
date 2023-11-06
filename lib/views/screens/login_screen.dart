import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../app_router.dart';
import '../../constants/dimens.dart';
import '../../generated/l10n.dart';
import '../../http/repositories/login_repository.dart';
import '../../providers/user_data_provider.dart';
import '../../store/auth/auth_state.dart';
import '../../theme/theme_extensions/app_button_theme.dart';
import '../../utils/app_focus_helper.dart';
import '../../utils/storage_utils.dart';
import '../widgets/public_master_layout/public_master_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();
  final _autState = AuthState();

  var _isFormLoading = false;

  Future<void> _doLoginAsync({
    required UserDataProvider userDataProvider,
    required VoidCallback onSuccess,
    required void Function(String message) onError,
  }) async {
    AppFocusHelper.instance.requestUnfocus();

    if (_formKey.currentState?.validate() ?? false) {
      // Validation passed.
      _formKey.currentState!.save();

      setState(() => _isFormLoading = true);

      Future.delayed(const Duration(seconds: 1), () async {
        await userDataProvider.setUserDataAsync(
          username: 'Housenet Admin',
          userProfileImageUrl: 'https://cashier.housenet.am/img/avatar-s-3.7ed1da4a.jpg',
        );

        try {
          final res = await LoginRepository.login(_formData.username, _formData.password);

          if (res.accessToken?.isNotEmpty ?? false) {
            final token = '${res.accessToken}';
            _autState.accessToken = token;
            await StorageUtils.setAccessToken(token);
            onSuccess.call();
          }
        } catch (error) {
          onError.call('Invalid username or password.');
        }

        setState(() => _isFormLoading = false);
      });
    }
  }

  void _onLoginSuccess(BuildContext context) {
    GoRouter.of(context).go(RouteUri.home);
  }

  void _onLoginError(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      desc: message,
      width: kDialogWidth,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    );

    dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);

    return PublicMasterLayout(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        height: 50,
                      ),
                    ),
                    // Text(
                    //   lang.appTitle,
                    //   style: themeData.textTheme.headlineMedium!.copyWith(
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
                      child: Text(
                        lang.adminPortalLogin,
                        style: themeData.textTheme.titleMedium,
                      ),
                    ),
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                            child: FormBuilderTextField(
                              name: 'username',
                              decoration: InputDecoration(
                                labelText: lang.username,
                                hintText: lang.username,

                                //   helperText: '* Demo username: admin',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior: FloatingLabelBehavior
                                    .always,
                              ),
                              enableSuggestions: false,
                              validator: FormBuilderValidators.required(),
                              onSaved: (value) => _formData.username = value ?? '',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
                            child: FormBuilderTextField(
                              name: 'password',
                              decoration: InputDecoration(
                                labelText: lang.password,
                                hintText: lang.password,
                                //  helperText: '* Demo password: admin',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior: FloatingLabelBehavior
                                    .always,
                              ),
                              enableSuggestions: false,
                              obscureText: true,
                              validator: FormBuilderValidators.required(),
                              onSaved: (value) => _formData.password = value ?? '',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: kDefaultPadding),
                            child: SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: themeData.extension<AppButtonTheme>()!
                                    .primaryElevated,
                                onPressed: (_isFormLoading
                                    ? null
                                    : () =>
                                    _doLoginAsync(
                                      userDataProvider: context.read<
                                          UserDataProvider>(),
                                      onSuccess: () => _onLoginSuccess(context),
                                      onError: (message) =>
                                          _onLoginError(context, message),
                                    )),
                                child: Text(lang.login),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormData {
  String username = '';
  String password = '';
}
