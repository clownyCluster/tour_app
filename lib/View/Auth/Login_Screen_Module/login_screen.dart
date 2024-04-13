import 'package:auto_route/auto_route.dart';
import 'package:tour_destiny/Bloc/Login_cubit/login_cubit.dart';
import 'package:tour_destiny/utils/constant/k_text_form_field.dart';
import 'package:tour_destiny/utils/constant/painter.dart';
import 'package:tour_destiny/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/services/network_response/status.dart';
import '../../../utils/constant/constant.dart';
import '../../../utils/localization/english_text.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  FocusNode passwordFocus = FocusNode();
  FocusNode loginFocus = FocusNode();

  // @override
  // void dispose() {
  //   super.dispose();

  //   passwordController.dispose();
  //   emailController.dispose();
  //   emailFocus.dispose();
  //   passwordFocus.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<LoginBloc>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          // image: NetworkImage(
          //   '$tours_url/tour-6-3.jpg',
          // ),
          image: AssetImage('assets/images/bg.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: primaryColor,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: CustomPaint(
                painter: greyCustomPainter(),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                // key: formKey,
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          // Image.asset(
                          //   'assets/images/logo.png',
                          //   height: 120,
                          //   width: 120,
                          // ),
                          Center(
                              child: Image.asset(
                            'assets/images/appLogoBlack.png',
                            height: 150,
                          )),

                          Text(
                            Language().welcomeTo,
                            style: kkWhiteBoldTextStyle().copyWith(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            Language().appName,
                            style:
                                kkWhiteBoldTextStyle().copyWith(fontSize: 22),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 0.5,
                                    color: whiteColor.withOpacity(0.4)),
                                boxShadow: [
                                  BoxShadow(
                                    // color: Colors.grey.withOpacity(0.2),
                                    color: Color.fromARGB(31, 255, 255, 255),
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ]),
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kSizedBox(),
                                Text(
                                  'Email',
                                  style: kkWhiteBoldTextStyle(),
                                ),
                                kSizedBox(),
                                KTextFormField(
                                    controller: emailController,
                                    hint: 'example@gmail.com',
                                    prefixIcon: Icon(Icons.email),
                                    focusNode: emailFocus,
                                    onFieldSubmitted: (val) {
                                      Utils.fieldFocusNode(
                                          context, passwordFocus, emailFocus);
                                    }),
                                kSizedBox(),
                                Text(
                                  'Password',
                                  style: kkWhiteBoldTextStyle(),
                                ),
                                kSizedBox(),
                                KTextFormField(
                                  controller: passwordController,
                                  focusNode: passwordFocus,
                                  onFieldSubmitted: (val) {
                                    Utils.fieldFocusNode(
                                      context,
                                      loginFocus,
                                      passwordFocus,
                                    );
                                  },
                                  hint: '********',
                                  suffixIcon: Icon(Icons.visibility_off),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  // fillColor: Utils.fieldFocusNode(
                                  //   context,
                                  //   loginFocus,
                                  //   passwordFocus,
                                  // ),
                                ),
                                kSizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: kTextStyle().copyWith(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                LSizedBox(),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    focusNode: loginFocus,
                                    onPressed: () {
                                      context.read<LoginCubit>().loginUser(
                                            emailController.text,
                                            passwordController.text,
                                            context,
                                          );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          state.isLoading == true
                                              ? const CircularProgressIndicator
                                                  .adaptive()
                                              : Text(
                                                  'Login',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                ),
                                        ],
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      // padding: MaterialStateProperty.,
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        amberColor,
                                      ),
                                    ),
                                  ),
                                ),
                                LSizedBox(),
                                kSizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don\'t have an account? ',
                                      style: kWhiteTextStyle(),
                                    ),
                                    kSizedBox(),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'Sign In',
                                        style: kBoldTextStyle().copyWith(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                LSizedBox(),
                              ],
                            ),
                          ),
                          LSizedBox(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
