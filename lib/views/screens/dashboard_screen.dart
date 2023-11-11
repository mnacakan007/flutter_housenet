import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import '../../app_router.dart';
import '../../constants/dimens.dart';
import '../../generated/l10n.dart';
import '../../store/auth/auth_state.dart';
import '../../store/client_details_state/client_details_state.dart';
import '../widgets/portal_master_layout/portal_master_layout.dart';
import '../widgets/snack_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final _clientDetails = ClientDetails();
  final _autState = AuthState();
  // late ReactionDisposer disposer;

  String errorText = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // autorun((_) => debugPrint('autorun >>>>>>>>>>>>>>>>>>:  ${_clientDetails.isLoading}'));

    // disposer = reaction((_) => _clientDetails.notFoundError, (notFoundError) {
    //   if (notFoundError.isNotEmpty) {
    //     // your code
    //   }
    // });

    when((_) => _clientDetails.error.isNotEmpty, showError);
  }

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();
    _searchController.dispose();
    // disposer();

    super.dispose();
  }

  void getClientDetails(String userName) {
    _clientDetails.getClientDetails(userName);
  }

  void showError() {
    final lang = Lang.of(context);
    final goRouter = GoRouter.of(context);

    showFlashError(context, lang.somethingWentWrong);
    _autState.logout();
    goRouter.go(RouteUri.logout);
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);

    return PortalMasterLayout(
      body: Observer(
        builder: (_) => ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              lang.searchService,
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: lang.phoneNumber,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    onSubmitted: getClientDetails,
                  ),
                  const SizedBox(height: 5),
                  Text(_clientDetails.phoneNumberNotFound ? lang.phoneNumberNotFound : '',
                    style: const TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: _clientDetails.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : _clientDetails.thereIsClientData
                      ? Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Adjust the border radius as needed
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _clientDetails.clientDetails?.address ?? '',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Icon(Icons.local_phone_outlined),
                                      const SizedBox(width: 5),
                                      Text(
                                        _clientDetails
                                                .clientDetails?.phoneNumber ??
                                            '',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        lang.tariff,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${_clientDetails.clientDetails?.tariff} դ' ??
                                            '',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        lang.suggestedAmount,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        '${_clientDetails.clientDetails?.recommended} դ' ??
                                            '',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        height: 40,
                                        child: FormBuilderTextField(
                                          name: 'payment_amount',
                                          decoration: InputDecoration(
                                            hintText: lang.paymentAmount,
                                            hintStyle: const TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, .4),
                                            ),
                                            border: const OutlineInputBorder(),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          validator:
                                              FormBuilderValidators.required(),
                                          onSaved: (value) => {},
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color(0xFFE4003A),
                                          ),
                                          textStyle: MaterialStateProperty.all(
                                            const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(lang.payment),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
