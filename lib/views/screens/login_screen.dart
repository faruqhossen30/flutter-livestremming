

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:livestreaming/const/const.dart';
import 'package:livestreaming/views/screens/register_screen.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:upgrader/upgrader.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';
  final _mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String fomatedMobile = '';

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        showIgnore: false,
        showLater: false,
        durationUntilAlertAgain: const Duration(hours: 1),
      ),
      child: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xffF9F6DE), Color(0xffFC8265), Color(0xffC64ECF)]),
          image: DecorationImage(
              image: AssetImage('assets/bg/11.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset('assets/images/logo.png', width: 100),
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: 50,
                      //   child: CircleAvatar(
                      //     backgroundImage: AssetImage('assets/images/logocamera.png'),
                      //     radius: 48,
                      //   ),
                      // ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'AKASH   LIVE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Monoton',
                            fontSize: 30
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                        ),
                        child: InternationalPhoneNumberInput(
                          inputDecoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          spaceBetweenSelectorAndTextField: 5,
                          onInputChanged: (PhoneNumber number) {
                            // print(number.phoneNumber);
                            fomatedMobile = number.phoneNumber.toString();
                          },
                          onInputValidated: (bool value) {
                            // print(value);
                            // fomatedMobile=value..toString();
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            setSelectorButtonAsPrefixIcon: false,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          textStyle: TextStyle(color: Colors.white),
                          selectorTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          // initialValue: number,
                          textFieldController: _mobileController,
                          formatInput: true,
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),

                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Obx(() {
                      //   return TextFormField(
                      //     controller: _passwordController,
                      //     // obscureText: _constController.isPasswordShow.value,
                      //     style: TextStyle(color: Colors.white),
                      //     decoration: InputDecoration(
                      //       labelText: 'Password',
                      //       labelStyle: TextStyle(color: Colors.white),
                      //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      //       focusColor: Colors.white,
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                      //       ),
                      //       prefixIcon: Icon(
                      //         Icons.lock,
                      //         color: Colors.white,
                      //       ),
                      //       suffixIcon: IconButton(
                      //         icon: Icon(Icons.visibility_off),
                      //         onPressed: () {
                      //
                      //         },
                      //       ),
                      //       contentPadding: EdgeInsets.all(8),
                      //     ),
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Please enter your password';
                      //       }
                      //       return null;
                      //     },
                      //   );
                      // }),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // AuthService().logIn(fomatedMobile, _passwordController.text, context);
                          }
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          minimumSize: const Size.fromHeight(40),
                          side: BorderSide(),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                              color: Colors.white,
                            )),
                        Text("OR", style: TextStyle(color: Colors.white)),
                        Expanded(
                            child: Divider(
                              color: Colors.white,
                            )),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 12,
                            ),
                            label: Text(
                              'Register',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            onPressed: () {
                              Get.off(() => RegisterScreen());
                            },
                          ),
                          TextButton.icon(
                            icon: Icon(
                              Icons.lock_clock_outlined,
                              color: Colors.white,
                              size: 12,
                            ),
                            label: Text('Forget Password', style: Theme.of(context).textTheme.titleSmall),
                            onPressed: () async {
                              // Get.off(() => ForgetPasswordScreen());
                              Fluttertoast.showToast(msg: 'Under construction');
                            },
                          ),
                          TextButton.icon(
                            icon: Icon(
                              Icons.headset_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                            label: Text('Helpline', style: Theme.of(context).textTheme.titleSmall),
                            onPressed: () async {
                              http.Response response = await http.get(Uri.parse("${baseURL}/helpline"));
                              var decodeData = jsonDecode(response.body);
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: HtmlWidget(decodeData['info'].toString()),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}