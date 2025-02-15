import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/transaction.dart';
import 'package:youoweme_project/core/models/transaction_status.dart';
import 'package:youoweme_project/core/models/transaction_type.dart';
import 'package:youoweme_project/core/services/validator_service.dart';
import 'package:youoweme_project/core/utils/navigation_helper.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/buttons/big_add_button.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/buttons/small_add_button_slider.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/date_picker/date_picker_slider.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/dropdown/dropdown_slider.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/text_fields/text_field_slider.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  late final Contact _selectedContact;
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  // ignore: avoid_init_to_null
  DateTime? _paymentDay = null;
  final TransactionType _transactionType = TransactionType.loan;
  final TransactionStatus _transactionStatus = TransactionStatus.open;

  @override
  void initState() {
    final viewModel = Provider.of<LocalViewModel>(context, listen: false);
    super.initState();
    _selectedContact = viewModel.selectedContact!;
  }

  void _addPerson() {
    final viewModel = Provider.of<LocalViewModel>(context, listen: false);
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final transaction = Transaction.withoutId(
      amount: double.parse(_amount.text),
      title: _title.text,
      description: _description.text.isEmpty ? null : _description.text,
      contact: _selectedContact,
      createdAt: DateTime.now(),
      paymentDay: _paymentDay,
      transactionStatus: _transactionStatus,
      transactionType: _transactionType,
    );

    viewModel.addTransactionToContact(transaction);
    viewModel.selectContact(transaction.getContact());
    Navigator.pop(context);
    NavigationHelper.navigateToContact(context);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppStyles.primaryColor(context),
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 32,
                ),
              ),
              Row(
                children: [
                  DropDownSlider(
                    validator: (contact) =>
                        ValidatorService.validateContact(contact),
                    label: "Kies contact",
                    selectedItem: viewModel.selectedContact,
                    items: viewModel.contacts,
                    itemLabelBuilder: (contact) => contact.giveName(),
                    onChanged: (contact) =>
                        setState(() => _selectedContact = contact!),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SmallAddButtonSlider(),
                ],
              ),
              InputFieldSlider(
                controller: _amount,
                hintText: "Bedrag",
                numberKeyboard: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => ValidatorService.validateDouble(value),
              ),
              InputFieldSlider(
                controller: _title,
                hintText: "Titel",
                validator: (value) =>
                    ValidatorService.validateFieldIsNotEmpty(value),
              ),
              InputFieldSlider(
                controller: _description,
                hintText: "Beschrijving",
                maxLines: 2,
              ),
              DatePickerSlider(
                  label: "Betaal datum",
                  onDateSelected: (date) => setState(() => _paymentDay = date)),
              // * Dit komt bij een latere versie
              // DropDownSlider(
              //   hintText: "Type",
              //   items: TransactionType.values,
              //   itemLabelBuilder: (transactionType) => transactionType.name,
              //   onChanged: (transactionType) =>
              //       _transactionType = transactionType!,
              // ),
              Expanded(child: SizedBox()),
              BigAddButtonSlider(
                text: "Toevoegen",
                color: AppStyles.primaryBlue(context),
                onPressed: () {
                  _addPerson();
                },
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
