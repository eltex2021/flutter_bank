// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bank/auth/authentication.dart';
import 'package:flutter_bank/screens/home/home_screen.dart';
import 'package:flutter_bank/widgets/my_snack_bar.dart';
import 'package:flutter_bank/theme/color_theme.dart';
import 'package:flutter_bank/theme/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isObscureText = true;
  bool _isRemember = false;
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //for firebase
  User? _user;
  bool _isEmailAlreadyInUse = false;
  bool _isSuccessfully = false;

  String? _password;
  String? _email;

  getObscureBool() => _isObscureText = !_isObscureText;

  getRemember() => _isRemember = !_isRemember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: [
              Row(
                children: const [
                  Text("Sign Up", style: AppTexsts.welcome),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Form(key: _formKey, child: textFormFields()),
              const SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        groupValue: _isRemember,
                        value: true,
                        onChanged: (value) {
                          setState(() {
                            getRemember();
                          });
                        },
                      ),
                      const Text("Remember me"),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {},
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
                    print("клик");

                    if (_formKey.currentState!.validate()) {
                      await registrationNewUser(
                          _txtEmail.text, _txtPassword.text);
                      _user = await Authentication().getUser();

                      if (_isSuccessfully == true) {
                        setState(() {
                          _email = _txtEmail.text;
                          _password = _txtPassword.text;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          MySnackBar.mySnackBar,
                        );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      } else if (_isEmailAlreadyInUse == true) {
                        print("Этот email уже занят");
                        setState(() {
                          _txtEmail.text = "";
                          _txtPassword.text = "";
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          MySnackBar.mySnackBar1,
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(MySnackBar.mySnackBar2);
                        print("Регистрация не удалась");
                      }
                    }
                  },
                  child: const Text("SIGNUP", style: AppTexsts.login),
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
                  const Text("Already have an Account ? "),
                  GestureDetector(
                    onTap: () {},
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
          //для выравнивания текста в текстфилд
          textAlignVertical: TextAlignVertical.center,
          controller: _txtEmail,

          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: "email",
            prefixIcon: Icon(
              Icons.person,
              color: AppColors.blueMain,
            ),
          ),

          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter email';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 39,
        ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: _txtPassword,
          obscureText: _isObscureText,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: 'password',
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
              child: _isObscureText
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
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            }
            String prov = "[a-zA-Z0-9][a-zA-Z0-9-]{6,50}";
            RegExp regExp = RegExp(prov);
            if (regExp.hasMatch(_txtPassword.text)) {
              return null;
            }

            return 'Длина пароля менее 6 символов';
          },
        ),
      ],
    );
  }

  //из примера https://firebase.flutter.dev/docs/auth/usage/#registration в гитхаб
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _txtEmail.dispose();
    _txtPassword.dispose();
    super.dispose();
  }

  Future<void> registrationNewUser(String email, String password) async {
    try {
      final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      _isSuccessfully = true;

      print("Новый пользователь создан");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        _isEmailAlreadyInUse = true;
        print('Ошибка - The account already exists for that email.');
      } else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      }
    } catch (e) {
      print(e);
    }
  }
}
