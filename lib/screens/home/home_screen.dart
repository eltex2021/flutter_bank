import 'package:flutter/material.dart';
import 'package:flutter_bank/screens/home/widgets/home_screen_chips.dart';
import 'package:flutter_bank/screens/home/widgets/home_screen_positioned_your_spent.dart';
import 'package:flutter_bank/screens/home/widgets/home_screen_row_text_button.dart';
import 'package:flutter_bank/screens/home/widgets/home_screen_row_transactions.dart';
import 'package:flutter_bank/screens/home/widgets/home_screen_your_amount.dart';
import 'package:flutter_bank/theme/color_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightFon,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.blueMain,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)),
                    ),
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 50,
                        ),
                        HomeScreenYourAmount(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  const HomeScreenRowTextButton(),
                  const SizedBox(
                    height: 15,
                  ),
                  const HomeScreenRowTransactions(),
                  const SizedBox(
                    height: 15,
                  ),
                  const HomeScreenChips(),
                ],
              ),
              const HomeScreenPositionedYourSpent(),
              //виджет с круговой диаграммой сколько потратили
            ],
          ),
        ));
  }
}

// shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
