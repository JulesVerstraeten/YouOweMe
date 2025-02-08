import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class ToggleTransactionState extends StatefulWidget {
  const ToggleTransactionState({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleTransactionStateState createState() => _ToggleTransactionStateState();
}

class _ToggleTransactionStateState extends State<ToggleTransactionState> {
  bool isActiveSelected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Center(
        child: IntrinsicWidth(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: AppStyles.primaryColor(context),
                borderRadius: BorderRadius.circular(16)),
            child: Stack(
              // TODO Dit moet verbeterd worden!
              alignment: Alignment.centerLeft,
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 100),
                  left: isActiveSelected ? 0 : 92,
                  child: Container(
                    width: isActiveSelected ? 92 : 110,
                    //width: MediaQuery.of(context).size.width * 0.165,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppStyles.secondaryColor(context),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isActiveSelected = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Actueel',
                          style: TextStyle(
                            color: isActiveSelected
                                ? AppStyles.colorSelectedTextSwitchButton(
                                    context)
                                : AppStyles.colorTextSwitchButton(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isActiveSelected = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Verrekend',
                          style: TextStyle(
                            color: !isActiveSelected
                                ? AppStyles.colorSelectedTextSwitchButton(
                                    context)
                                : AppStyles.colorTextSwitchButton(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
