import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../constants/dimens.dart';
import '../../generated/l10n.dart';
import '../../store/client_details_state/client_details_state.dart';
import '../widgets/portal_master_layout/portal_master_layout.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final _clientDetails = ClientDetails();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();
    _searchController.dispose();

    super.dispose();
  }

  void getClientDetails(String userName) {
    debugPrint('userName dashboard $userName');
    _clientDetails.getClientDetails(userName);
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context); // Access lang through the context

    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            lang.dashboard, // Now you can access lang
            style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Հեռախոսահամար',
                hintStyle: TextStyle(fontSize: 14, color: Color.fromRGBO(0,0,0,.4)),
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: getClientDetails,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Adjust the border radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Observer(
                  builder: (_) => Padding(
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
                              _clientDetails.clientDetails?.phoneNumber ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Սակագին', style: TextStyle(fontSize: 16)),
                            Text(
                              '${_clientDetails.clientDetails?.tariff} դ' ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Առաջարկվող Գումար', style: TextStyle(fontSize: 16)),
                            Text(
                              '${_clientDetails.clientDetails?.recommended} դ' ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: FormBuilderTextField(
                                name: 'payment_amount',
                                decoration: const InputDecoration(
                                  hintText: 'Վճարման գումար',
                                  hintStyle: TextStyle(fontSize: 12, color: Color.fromRGBO(0,0,0,.4)),
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior: FloatingLabelBehavior
                                      .always,
                                ),
                                validator: FormBuilderValidators.required(),
                                onSaved: (value) => {},
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                                    padding:
                                    MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                                    textStyle: MaterialStateProperty.all(
                                        const TextStyle(fontSize: 14, color: Colors.white))),
                                onPressed: () {},
                                child: const Text('Վճարում'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
