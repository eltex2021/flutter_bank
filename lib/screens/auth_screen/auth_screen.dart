// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/auth/authentication.dart';
import 'package:flutter_bank/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutter_bank/screens/home/bottom_nav.dart';
import 'package:flutter_bank/screens/home/home_screen.dart';
import 'package:flutter_bank/screens/signup_screen/sign_up_screen.dart';
import 'package:flutter_bank/theme/color_theme.dart';
import 'package:flutter_bank/theme/text_theme.dart';
import 'package:flutter_bank/widgets/my_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);





  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isObscureText = true;
  bool isRemember = false;
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  User? _user;

  getObscureBool() => isObscureText = !isObscureText;

  getRemember() => isRemember = !isRemember;

  //для обновления экрана при смене пользователя...если нужно
  // @override
  // void initState() {
  //   _firebaseAuth.userChanges().listen(
  //         (event) => setState(() => _user = event),
  //       );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    print("_firebaseAuth.currentUser!.email");
    print(_firebaseAuth.currentUser?.email);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: [
              const SizedBox(
                height: 124,
              ),
              Row(
                children: const [
                  Text("Welcome", style: AppTexsts.welcome),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              textFormFields(),
              const SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        groupValue: isRemember,
                        value: true,
                        onChanged: (value) {
                          setState(() {
                            getRemember();
                            //isRemember = !isRemember;
                            print(isRemember);
                          });
                        },
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  //const Text("Remember me"),
                  GestureDetector(
                    onTap: () {
                      //print("забыли пароль клик");
                      if (_txtEmail.text != "") {
                        Authentication().getForgotPassword(_txtEmail.text);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(MySnackBar.mySnackBar7);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(MySnackBar.mySnackBar6);
                      }
                    },
                    child: const Text(
                      "Forgot password?",
                      style: AppTexsts.forgot,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 47,
              ),
              SizedBox(
                width: 307,
                height: 56,
                child: TextButton(
                  onPressed: () async {
                    //для выхода из авторизации прошлого пользователя
                    //чтобы можно было заново зайти другому user
                    //для тестирования работы
                    _signOut();

                    await authorizationUser(_txtEmail.text, _txtPassword.text);
                    _user = await Authentication().getUser();

                    //final User? user = _firebaseAuth.currentUser;
                    //print(_user?.email.toString());

                    if (_user?.email.toString() == _txtEmail.text) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => BottomNavigationBloc(),
                              child: MainScreen(),
                            ),
                          ));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(MySnackBar.mySnackBar3);
                      //print("ошибка");
                    }
                  },
                  child: const Text("LOGIN", style: AppTexsts.login),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.blueMain),
                  ),
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Row(
                children: [
                  const Text("Don’t have an Account ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                            //builder: (context) => ScreenOne(),
                          ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: AppTexsts.forgot,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column textFormFields() {
    return Column(
      children: [
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: _txtEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: AppColors.blueMain,
            ),
          ),
        ),
        const SizedBox(
          height: 39,
        ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: _txtPassword,
          obscureText: isObscureText,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.blueMain,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  getObscureBool();
                });
              },
              child: isObscureText
                  ? const Icon(
                      Icons.remove_red_eye,
                      color: AppColors.blueMain,
                    )
                  : const Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.blueMain,
                    ),
            ),
          ),
        ),
      ],
    );
  }

  /// Example code for sign out.
  Future<void> _signOut() async {
    await _firebaseAuth.signOut();
  }

  //Авторизация с проверкой на ошибки
  Future<void> authorizationUser(String email, String password) async {
    try {
      final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(MySnackBar.mySnackBar4);
        print('Ошибка - wrong-password');
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(MySnackBar.mySnackBar5);
        print('Ошибка - user-not-found');
      }
    } catch (e) {
      print(e);
    }
  }
}
