import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);
    final selectedContact = viewModel.selectedContact;

    return Scaffold(
      body: Center(
        child: Text(selectedContact!.giveName()),
      ),
    );
  }
}
