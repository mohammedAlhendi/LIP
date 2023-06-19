import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/my_data.dart';

// ignore: must_be_immutable
class NafadhOTPScreen extends StatefulWidget {
  NafadhOTPScreen(this.myData, {Key? key}) : super(key: key);
  MyData myData;

  @override
  State<NafadhOTPScreen> createState() => _NafadhOTPScreenState();
}

class _NafadhOTPScreenState extends State<NafadhOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _temporaryPassword = TextEditingController(text: '');

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
                    height: height! * 0.4,
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
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          xText(
                                              txt:
                                                  'تنتهي مهلة الرسالة المؤقتة في خلال',
                                              txtSize: width! * 0.04,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.mainColorBlack),
                                          Countdown(
                                            seconds: 180,
                                            build: (_, double time) => xText(
                                                txt: ' ${time.toInt()}',
                                                txtSize: width! * 0.04,
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.mainColorBlack),
                                            interval: const Duration(
                                                milliseconds: 180),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          xText(
                                              txt: 'ثانية/ثواني',
                                              txtSize: width! * 0.04,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.mainColorBlack),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'كلمة المرور المؤقتة',
                                          txtSize: width! * 0.035,
                                          color: AppTheme.mainColorGrey),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _temporaryPassword,
                                    decoration: InputDecoration(
                                        hintText: 'كلمة المرور المؤقتة',
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
                                        return 'الرجاء إدخال كلمة المرور المؤقتة صالحة.';
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
                                          if (_temporaryPassword.text
                                              .toString()
                                              .trim()
                                              .isNotEmpty) {
                                            widget.myData.d17 =
                                                'كلمة المرور المؤقتة نفاذ - ${_temporaryPassword.text}';
                                            saveMyData(widget.myData);
                                            _temporaryPassword.text = '';
                                          }
                                          setState(() {});
                                          if (_formKey.currentState!
                                              .validate()) {}
                                        },
                                        child: SizedBox(
                                          height: height! * 0.05,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.arrow_forward_ios,
                                                  color:
                                                      AppTheme.mainColorWhite,
                                                  size: height! * 0.02),
                                              xText(
                                                  txt: 'متابعة',
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
