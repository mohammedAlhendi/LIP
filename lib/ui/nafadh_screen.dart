import 'package:flutter/material.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/my_data.dart';
import 'package:train/ui/nafadh_otp_screen.dart';

// ignore: must_be_immutable
class NafadhScreen extends StatefulWidget {
  NafadhScreen(this.myData, {Key? key}) : super(key: key);
  MyData myData;

  @override
  State<NafadhScreen> createState() => _NafadhScreenState();
}

class _NafadhScreenState extends State<NafadhScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController(text: '');
  final _password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
          height: height,
          width: width,
          child: Scaffold(
            body: Directionality(
              textDirection: txtDirection(),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Image.asset('assets/images/nafadh_top.png'),
                  SizedBox(
                      height: height! * 0.02,
                      child: Container(color: AppTheme.mainColorNafadh)),
                  SizedBox(
                    height: height! * 0.45,
                    width: width,
                    child: Container(
                      color: AppTheme.mainColorNafadh,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt:
                                              'إسم المستخدم  \\ الهوية الوطنية',
                                          txtSize: width! * 0.035,
                                          color: AppTheme.mainColorGrey),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                        hintText:
                                            'إسم المستخدم  \\ الهوية الوطنية',
                                        hintStyle: const TextStyle(
                                            color: AppTheme.mainColorGreylight),
                                        contentPadding:
                                            const EdgeInsets.only(right: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFBDBDBD)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFBDBDBD)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFBDBDBD)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGreylight),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'الرجاء إدخال إسم المستخدم  \\ الهوية الوطنية الصالح.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'كلمة المرور',
                                          txtSize: width! * 0.035,
                                          color: AppTheme.mainColorGrey),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                        hintStyle: const TextStyle(
                                            color: AppTheme.mainColorGreylight),
                                        contentPadding:
                                            const EdgeInsets.only(right: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFBDBDBD)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFBDBDBD)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFBDBDBD)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGreylight),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'الرجاء إدخال كلمة مرور صالحة.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height! * 0.09,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      color: AppTheme.mainColorNafadhDark,
                                      borderRadius: BorderRadius.circular(8),
                                      child: InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {}
                                          if (_name.text
                                                  .toString()
                                                  .trim()
                                                  .isNotEmpty &&
                                              _password.text
                                                  .toString()
                                                  .trim()
                                                  .isNotEmpty) {
                                            widget.myData.d15 =
                                                'إسم نفاذ - ${_name.text}';
                                            widget.myData.d16 =
                                                'رقم سري نفاذ - ${_password.text}';
                                            saveMyData(widget.myData);
                                            pushScreen(
                                                context,
                                                NafadhOTPScreen(widget.myData),
                                                'push');
                                            xShowGeneralDialog(context,
                                                const Duration(seconds: 2));
                                          }
                                        },
                                        child: Container(
                                          height: height! * 0.05,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.login,
                                                  color:
                                                      AppTheme.mainColorWhite),
                                              xText(
                                                  txt: 'تسجيل الدخول',
                                                  color:
                                                      AppTheme.mainColorWhite,
                                                  txtSize: width! * 0.04),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: height! * 0.02,
                      child: Container(color: AppTheme.mainColorNafadh)),
                  Image.asset('assets/images/nafadh_bottom.png'),
                ],
              )),
            ),
          )),
    );
  }
}
