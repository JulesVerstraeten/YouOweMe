import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/models/transaction_type.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/buttons/big_add_button.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/buttons/small_add_button_slider.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/dropdown/dropdown_slider.dart';
import 'package:youoweme_project/views/widgets/forms/form_items/text_fields/text_field_slider.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  late Contact _selectedContact;
  late String _amount;
  late String _title;
  late String? _description;
  late DateTime _createdAt;
  late DateTime? _paymentDay;
  late TransactionType _transactionType;

  void _validateForm() {
    if (_formKey.currentState!.validate()) {}
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
                    selectedItem: viewModel.selectedContact,
                    items: viewModel.contacts,
                    itemLabelBuilder: (contact) => contact.giveName(),
                    onChanged: (contact) {
                      _selectedContact = contact!;
                    },
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SmallAddButtonSlider(),
                ],
              ),
              InputFieldSlider(
                hintText: "Bedrag",
                numberKeyboard: TextInputType.number,
              ),
              InputFieldSlider(
                hintText: "Titel",
              ),
              InputFieldSlider(
                hintText: "Beschrijving",
                maxLines: 2,
              ),
              InputFieldSlider(
                hintText: "Betaal datum",
              ),
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
                onPressed: (),
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
