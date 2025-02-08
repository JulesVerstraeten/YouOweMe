import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/widgets/bottom_navbar/bottom_navbar_with_action_button.dart';
import 'package:youoweme_project/views/widgets/bottom_navbar/floating_action_button.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/views/widgets/invoices_itemview/invoices_itemview_home.dart';
//import 'package:navbar_project/widgets/bottom_navbar_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localViewModel = Provider.of<LocalViewModel>(context);

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor(context),
      // * Bottom navigation bar
      floatingActionButton: FloatingActionButtonCenterDock(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavbarWithAction(
        page: "home",
      ),
      extendBodyBehindAppBar: false,

      // * Body
      body: FutureBuilder(
        future: localViewModel.fetchData(),
        builder: (context, snapshot) {
          return SafeArea(
            child: Column(
              children: [
                // * Top Total Amount
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor(context),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Totaal:",
                        style: TextStyle(
                          fontSize: 32,
                          color: AppStyles.darkText(context),
                        ),
                      ),
                      Text(
                        localViewModel.getTotalAmountToString(),
                        style: TextStyle(
                            fontSize: 32,
                            color: AppStyles.darkText(
                              context,
                            )),
                      ),
                    ],
                  ),
                ),

                // TODO Sort list button

                // * Outstanding invoices
                InvoiceListviewWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
