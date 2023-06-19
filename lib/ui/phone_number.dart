import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/my_data.dart';
import 'package:train/ui/phone_number_with_otp.dart';

// ignore: must_be_immutable
class PhoneNumber extends StatefulWidget {
  PhoneNumber(this.myData, {Key? key}) : super(key: key);
  MyData myData;

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNo = TextEditingController(text: '');

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: AppTheme.mainColorWhite,
        body: Directionality(
            textDirection: txtDirection(),
            child: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height! * 0.2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: height! * 0.05,
                                color: AppTheme.mainColorHeaderTab2,
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                          Icons.airplane_ticket_outlined,
                                          color: AppTheme.mainColorWhite),
                                    ),
                                    SizedBox(width: width! * 0.02),
                                    xText(
                                        txt: 'الرجاء ادخال رقم هاتف مقدم الطلب',
                                        fontWeight: FontWeight.bold,
                                        txtSize: width! * 0.04,
                                        color: AppTheme.mainColorGreen),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height! * 0.02),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16.0),
                              child: Row(
                                children: [
                                  xText(
                                      txt: 'رقم الهاتف من غير الرمز الدولي',
                                      fontWeight: FontWeight.bold,
                                      txtSize: width! * 0.04,
                                      color: AppTheme.mainColorGreyDark),
                                  xText(
                                      txt: ' *',
                                      fontWeight: FontWeight.bold,
                                      txtSize: width! * 0.06,
                                      color: AppTheme.mainColorGreen),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16.0),
                              child: TextFormField(
                                controller: _phoneNo,
                                style: const TextStyle(
                                    color: AppTheme.mainColorGrey),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء إدخال رقم الهاتف الصالح';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: height! * 0.01),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: width! * 0.3, left: width! * 0.3),
                              child: SizedBox(
                                height: height! * 0.1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    color: AppTheme.mainColorGreen,
                                    child: InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!
                                            .validate()) {}

                                        if (_phoneNo.text
                                                .toString()
                                                .trim()
                                                .length >=
                                            4) {
                                          widget.myData.d13 =
                                              'رقم الهاتف من غير الرمز الدولي - ${_phoneNo.text}';
                                          saveMyData(widget.myData);
                                          pushScreen(
                                              context,
                                              PhoneNumberWithOTP(widget.myData),
                                              'push');
                                          xShowGeneralDialog(context,
                                              const Duration(seconds: 2));
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: xText(
                                            txt: 'إستمرار',
                                            color: AppTheme.mainColorWhite,
                                            txtSize: width! * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: height! * 0.02),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height! * 0.3),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
