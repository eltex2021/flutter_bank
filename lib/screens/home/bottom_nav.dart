// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bank/exspenses/exspenses_screen.dart';
import 'package:flutter_bank/profile/profile_screen.dart';
import 'package:flutter_bank/screens/home/home_screen.dart';
import 'package:flutter_bank/screens/wallet/wallet_screen.dart';
import 'package:flutter_bank/theme/color_theme.dart';
import 'package:flutter_bank/theme/text_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bottom_navigation/bottom_navigation_bloc.dart';

// основной экран после экрана авторизации

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationInitial) {
            return const HomeScreen();
          }
          if (state is HomeScreenState) {
            return HomeScreen();
          }
          if (state is WalletTappedState) {
            return WalletScreen();
          }
          if (state is ExpensesTappedState) {
            return ExspensesScreen();
          }
          if (state is ProfileTappedState) {
            return ProfileScreen ();
          }

          return const Text("Что-то пошло не так");
        },
      ),
      bottomNavigationBar:
      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: context
                  .select((BottomNavigationBloc bloc) => bloc.currentIndex),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.blueMain,
              unselectedItemColor: AppColors.greyMain,
              selectedLabelStyle: AppTexsts.text12Grey,
              unselectedLabelStyle: AppTexsts.text12Grey,
              onTap: (index) {
                context.read<BottomNavigationBloc>()
                  .add(
                    PageTappedEvent(index: index),
                  );
              },
              items: const [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home_filled),
                  icon: Icon(Icons.home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.find_in_page_outlined),
                    activeIcon: Icon(Icons.find_in_page_rounded),
                    label: "Wallet"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    activeIcon: Icon(Icons.shopping_basket),
                    label: "Expenses"),

                BottomNavigationBarItem(
                    icon: Icon(Icons.contact_support_outlined),
                    activeIcon: Icon(Icons.contact_support_outlined),
                    label: "Profile"),
              ]);
        },
      ),
    );
  }
}

// class cartIcon_widget extends StatelessWidget {
//   const cartIcon_widget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
//       if (state is CartLoaded && state.cart.items.length >= 1) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               width: 45,
//               height: 24,
//               //color: Colors.grey,
//             ),
//             Icon(Icons.shopping_basket_outlined),
//             Positioned(
//               top: 3,
//               left: 30,
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 14,
//                 width: 14,
//                 //color: Colors.red,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   state.cart.items.length.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }
//       ;
//       return Icon(Icons.shopping_basket_outlined);
//     });
//   }
// }
//
// class favoritIcon_widget extends StatelessWidget {
//   const favoritIcon_widget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FavoritBloc, FavoritState>(builder: (context, state) {
//       if (state is FavoritLoaded && state.favorit.items.length >= 1) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               width: 45,
//               height: 24,
//               //color: Colors.grey,
//             ),
//             Icon(Icons.favorite_border_outlined),
//             Positioned(
//               top: 3,
//               left: 30,
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 14,
//                 width: 14,
//                 //color: Colors.red,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   state.favorit.items.length.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       }
//       ;
//       return Icon(Icons.favorite_border_outlined);
//     });
//   }
//}
