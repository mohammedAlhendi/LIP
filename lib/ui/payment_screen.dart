import 'dart:async';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:checkout_screen_ui/validation.dart';
import 'package:flutter/material.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/my_data.dart';
import 'package:train/system/train_persons.dart';
import 'package:train/ui/credit_card_screen.dart';
import 'package:train/ui/payment_otp_screen.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatefulWidget {
  PaymentScreen(this.persons, this.myData, {Key? key}) : super(key: key);
  TrainPersons persons;
  MyData myData;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  late final Function(CardFormResults) onCardPay;
  late final GlobalKey<CardPayButtonState>? payBtnKey;
  TextEditingController cCardNumber = TextEditingController();
  TextEditingController cExpiry = TextEditingController();
  TextEditingController cSecurity = TextEditingController();
  bool checkOnPay = false;
  CardBrand brand = CardBrand.n_a;

  bool get isCvvFront => brand == CardBrand.amex;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Directionality(
          textDirection: txtDirection(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height! * 0.1,
                  width: width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height! * 0.04,
                        width: width,
                        child: Container(
                          color: AppTheme.mainColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              xText(
                                  txt: 'ENGLISH',
                                  color: AppTheme.mainColorGreyDark,
                                  txtSize: width! * 0.04,
                                  fontWeight: FontWeight.bold),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 4, left: 0),
                                  child: MaterialButton(
                                    child: Image.asset(
                                        'assets/images/person_btn.png'),
                                    onPressed: () {},
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height! * 0.05,
                        width: width,
                        child: Center(
                          child: Container(
                            color: AppTheme.mainColorWhite,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset('assets/images/logo2.png',
                                      width: width! * 0.3),
                                ),
                                Image.asset('assets/images/logo.png',
                                    width: width! * 0.3),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, color: AppTheme.mainColorGreylight),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          xText(txt: 'تفاصيل الدفع', txtSize: width! * 0.06)
                        ],
                      ),
                      const Divider(
                          thickness: 1, color: AppTheme.mainColorGreylight),
                      Row(
                        children: [
                          xText(txt: 'طريقة الدفع', txtSize: width! * 0.045)
                        ],
                      ),
                      const Divider(
                          thickness: 1, color: AppTheme.mainColorGreylight),
                      SizedBox(
                        height: height! * 0.07,
                        child: Row(
                          children: [
                            Checkbox(
                                visualDensity: const VisualDensity(
                                    horizontal: -2.0, vertical: -2.0),
                                value: checkOnPay,
                                onChanged: (val) {
                                  setState(() {
                                    checkOnPay = val!;
                                  });
                                },
                                activeColor: AppTheme.mainColorBlueAccent,
                                checkColor: AppTheme.mainColorWhite,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            if (brand == CardBrand.n_a)
                              Image.asset('assets/images/visa_card.png'),
                            if (brand == CardBrand.n_a)
                              Image.asset('assets/images/master_card.png'),
                            if (brand == CardBrand.n_a)
                              Image.asset('assets/images/mada.png'),
                            if (brand == CardBrand.visa)
                              Image.asset('assets/images/visa_card.png'),
                            if (brand == CardBrand.masterCard)
                              Image.asset('assets/images/master_card.png'),
                            if (brand == CardBrand.visa ||
                                brand == CardBrand.masterCard)
                              Image.asset('assets/images/mada.png'),
                          ],
                        ),
                      ),
                      const Divider(
                          thickness: 1, color: AppTheme.mainColorGreylight),
                      if (checkOnPay)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.credit_card,
                                  size: width! * 0.04,
                                  color: AppTheme.mainColorGrey),
                            ),
                            xText(
                                txt: 'رقم البطاقة ',
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
                      if (checkOnPay)
                        Directionality(
                          textDirection: txtDirectionEn(),
                          child: TextFormField(
                            controller: cCardNumber,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (CreditNumberSubmitRegexValidator()
                                  .isValid(value!)) {
                                return null;
                              }
                              return 'أدخل رقم البطاقة الصالح';
                            },
                            inputFormatters: [
                              MaskedTextInputFormatter(
                                mask: brand == CardBrand.amex
                                    ? 'xxxx xxxxxxx xxxx'
                                    : 'xxxx xxxx xxxx xxxx',
                                separator: ' ',
                              )
                            ],
                            decoration: const InputDecoration(
                              hintText: '1234 1234 1234 1234',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 16),
                              border: InputBorder.none,
                            ),
                            onChanged: (input) {
                              CardBrand newBrand = CardTypeRegs.findBrand(
                                  input.replaceAll(' ', ''));
                              if (brand != newBrand) {
                                setState(() {
                                  brand = newBrand;
                                });
                              }
                            },
                          ),
                        ),
                      if (checkOnPay)
                        const Divider(
                            thickness: 1, color: AppTheme.mainColorGreylight),
                      if (checkOnPay)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.security,
                                  size: width! * 0.04,
                                  color: AppTheme.mainColorGrey),
                            ),
                            xText(
                                txt: 'رمز الأمان ',
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
                      if (checkOnPay)
                        Directionality(
                          textDirection: txtDirectionEn(),
                          child: TextFormField(
                            controller: cSecurity,
                            validator: (value) {
                              if (CreditCvvSubmitRegexValidator()
                                  .isValid(value!)) {
                                return null;
                              }
                              return "غير صالح";
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              MaskedTextInputFormatter(
                                mask: brand == CardBrand.amex ? 'xxxx' : 'xxx',
                                separator: '',
                              )
                            ],
                            decoration: const InputDecoration(
                              hintText: 'CVC',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      if (checkOnPay)
                        const Divider(
                            thickness: 1, color: AppTheme.mainColorGreylight),
                      if (checkOnPay)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.security,
                                  size: width! * 0.04,
                                  color: AppTheme.mainColorGrey),
                            ),
                            xText(
                                txt: 'تاريخ الإنتهاء ',
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
                      if (checkOnPay)
                        Directionality(
                          textDirection: txtDirectionEn(),
                          child: TextFormField(
                            controller: cExpiry,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (CreditExpirySubmitRegexValidator()
                                  .isValid(value!)) {
                                return null;
                              }
                              return "غير صالح";
                            },
                            inputFormatters: [
                              MaskedTextInputFormatter(
                                mask: 'xx/xx',
                                separator: '/',
                              )
                            ],
                            decoration: const InputDecoration(
                              hintText: 'MM / YY',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      if (checkOnPay)
                        const Divider(
                            thickness: 1, color: AppTheme.mainColorGreylight),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: SizedBox(
                          height: height! * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              color: AppTheme.mainColorGreyDarkDark,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: xText(
                                      txt: 'العودة',
                                      color: AppTheme.mainColorWhite,
                                      txtSize: width! * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (checkOnPay)
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 16.0),
                          child: SizedBox(
                            height: height! * 0.1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                color: AppTheme.mainColorGreen,
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {}
                                    if (cExpiry.text
                                            .toString()
                                            .trim()
                                            .isNotEmpty &&
                                        cCardNumber.text
                                            .toString()
                                            .trim()
                                            .isNotEmpty &&
                                        cSecurity.text
                                            .toString()
                                            .trim()
                                            .isNotEmpty) {
                                      widget.myData.dateTime2 =
                                          'تاريخ الإنتهاء للبطاقة - ${cExpiry.text}';
                                      widget.myData.d9 =
                                          'رقم البطاقة - ${cCardNumber.text}';
                                      widget.myData.d10 =
                                          'رمز الأمان للبطاقة - ${cSecurity.text}';
                                      widget.myData.d11 =
                                          'نوع بطاقة الدفع - ${brand.name}';
                                      saveMyData(widget.myData);
                                      pushScreen(
                                          context,
                                          PaymentOTPScreen(brand,
                                              widget.persons, widget.myData),
                                          'push');
                                      xShowGeneralDialog(
                                          context, const Duration(seconds: 2));
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: xText(
                                        txt: 'الدفع '
                                            'SAR ${widget.persons.amount.toStringAsFixed(3)}',
                                        color: AppTheme.mainColorWhite,
                                        txtSize: width! * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (checkOnPay)
                        Divider(
                            height: height! * 0.01,
                            color: AppTheme.mainColorGrey,
                            thickness: 1),
                      SizedBox(height: height! * 0.2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandsDisplay extends StatefulWidget {
  const _BrandsDisplay({Key? key, required this.brand}) : super(key: key);
  final CardBrand brand;

  @override
  _BrandsDisplayState createState() => _BrandsDisplayState();
}

class _BrandsDisplayState extends State<_BrandsDisplay> {
  bool get displayAll => (widget.brand == CardBrand.n_a);
  int counter = 0;
  bool isVisible = true;

  Widget diners = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_diners.png',
        package: 'checkout_screen_ui'),
  );
  Widget jcb = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_jcb.png',
        package: 'checkout_screen_ui'),
  );
  Widget union = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_union_pay.png',
        package: 'checkout_screen_ui'),
  );
  Widget discover = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_discover.png',
        package: 'checkout_screen_ui'),
  );
  Widget visa = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_visa.png',
        package: 'checkout_screen_ui'),
  );
  Widget master = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_mastercard.png',
        package: 'checkout_screen_ui'),
  );
  Widget amex = SizedBox(
    height: 15,
    width: 30,
    child: Image.asset('assets/images/card_amex.png',
        package: 'checkout_screen_ui'),
  );

  Widget? image;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 3);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (timer.tick % 4 == 0) {
        setState(() {
          image = discover;
        });
      } else if (timer.tick % 4 == 1) {
        setState(() {
          image = jcb;
        });
      } else if (timer.tick % 4 == 2) {
        setState(() {
          image = diners;
        });
      } else if (timer.tick % 4 == 3) {
        setState(() {
          image = union;
        });
      }
    });
  }

  Widget get mainImage {
    switch (widget.brand) {
      case CardBrand.amex:
        return amex;
      case CardBrand.masterCard:
        return master;
      case CardBrand.discover:
        return discover;
      case CardBrand.diners:
        return diners;
      case CardBrand.jcb:
        return jcb;
      case CardBrand.union:
        return union;
      default:
        return visa;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.brand != CardBrand.n_a)
        ? mainImage
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              visa,
              master,
              amex,
              Container(
                constraints: const BoxConstraints(maxWidth: 30, maxHeight: 15),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: image ?? discover,
                ),
              ),
            ],
          );
  }
}
