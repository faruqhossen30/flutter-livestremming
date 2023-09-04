import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:livestreaming/controllers/const_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  ConstController _constController = Get.put(ConstController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String fomatedMobile = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Live Streming'),
                  Form(
                      child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(left: 10.sp),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white),
                          ),
                          child: InternationalPhoneNumberInput(
                            inputDecoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white, width: 1.0),
                              ),
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
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () async {},
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            minimumSize: const Size.fromHeight(40),
                            side: BorderSide(),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    Text("OR", style: TextStyle(color: Colors.grey)),
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 12,
                        ),
                        label: Text(
                          'Register',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          Get.off(() => RegisterScreen());
                        },
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.grey,
                          size: 12,
                        ),
                        label: Text(
                          'Forget Password',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () async {
                          // Get.off(() => ForgetPasswordScreen());
                          Fluttertoast.showToast(msg: 'Under construction');
                        },
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.headset_rounded,
                          color: Colors.grey,
                          size: 12,
                        ),
                        label: Text('Helpline',style: TextStyle(color: Colors.grey),),
                        onPressed: () async {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
