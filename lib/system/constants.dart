import 'dart:async';

import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:train/system/app_theme.dart';

String iP = 'qetarharamine.com/AJT_API',
    uRL = Uri.encodeFull('https://$iP'),
    currLang = 'en',
    phoneCompleteNumber = '',
    deviceId = '',
    deviceModel = '',
    deviceManufacturer = '',
    xTokens = '';
Size? size;
double? width, height, xElevation = 3;

//region URI GET
Uri uriGet = Uri.parse(Uri.encodeFull('https://$iP/XGET?query='));
//endregion URI GET

//region URI Post
Uri getUri(String body) {
  return Uri.parse(Uri.encodeFull('$uriGet$body'));
}

Uri uriPost = Uri.parse(Uri.encodeFull('https://$iP/XPOST'));

Uri uriSaveData = Uri.parse(Uri.encodeFull('https://$iP/x_savemydata'));

Map<String, String> get xHeaders => {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Basic UG93ZXJlZC1CeSA6IEhhc2FuIEFidSBHaGFseW91bg==',
    };
//endregion URI Post

TextDirection txtDirection() =>
    currLang == 'ar' ? TextDirection.ltr : TextDirection.rtl;

TextDirection txtDirectionEn() =>
    currLang == 'en' ? TextDirection.ltr : TextDirection.rtl;

Future<bool> refresh(void Function(VoidCallback fn) setState) async {
  setState(() {});
  return true;
}

Future<Object?> xShowGeneralDialog(BuildContext context, Duration duration) {
  return showGeneralDialog(
    context: context,
    barrierColor: const Color.fromRGBO(84, 70, 25, 1).withOpacity(0.9),
    barrierDismissible: false,
    pageBuilder: (_, __, ___) {
      Timer(duration, () {
        Navigator.of(context).pop();
      });
      return Center(
        child: SizedBox(
          height: height! * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/s_logo.png', width: width! * 0.4),
              LoadingAnimationWidget.prograssiveDots(
                  color: AppTheme.mainColorWhite, size: width! * 0.4),
            ],
          ),
        ),
      );
    },
  );
}

Text xText(
    {dynamic txt = '',
    double txtSize = 12.5,
    Color color = AppTheme.mainColorBlack,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    TextAlign textAlign = TextAlign.left}) {
  return Text(
    txt.toString(),
    textAlign: textAlign,
    // style: TextStyle(
    //     color: color,
    //     fontSize: txtSize,
    //     fontWeight: fontWeight,
    //     fontStyle: fontStyle)
    style: ArabicTextStyle(
        arabicFont: ArabicFont.tajawal,
        color: color,
        fontSize: txtSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle),
  );
}

Widget xTextField(TextEditingController controller,
    {String? txt,
    String hintTxt = '',
    double txtSize = 12.5,
    TextInputType txtInputType = TextInputType.text,
    Color color = AppTheme.mainColorBlack,
    int len = 10,
    bool showText = true,
    bool isEnable = true,
    Widget? prefixIcon,
    TextAlign txtAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      enabled: isEnable,
      inputFormatters: [LengthLimitingTextInputFormatter(len)],
      keyboardType: txtInputType,
      controller: controller,
      obscureText: !showText,
      textAlign: txtAlign,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(right: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFBDBDBD)),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFBDBDBD)),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFBDBDBD)),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: '$txt ${hintTxt.isEmpty ? '' : ':$hintTxt'}',
          labelStyle: ArabicTextStyle(
              arabicFont: ArabicFont.dinNextLTArabic,
              color: color,
              fontSize: txtSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle),
          prefixIcon: prefixIcon),
      autofocus: false,
    ),
  );
}

Widget xImageCard(
    {String image = '',
    BoxFit boxFit = BoxFit.fitHeight,
    Color color = AppTheme.mainColorTransparent}) {
  return Container(
    width: double.infinity,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
    child:
        Image.network(image, alignment: Alignment.center, fit: boxFit, scale: 1,
            loadingBuilder: (BuildContext ctx, Widget child, loadingProgress) {
      return loadingProgress == null
          ? child
          : const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppTheme.mainColorGreen),
              ),
            );
    }, errorBuilder: (context, error, stackTrace) {
      return Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: const Image(image: AssetImage('assets/images/program.webp')));
    }),
  );
}

void xSnackBar(BuildContext context, String text,
    [bool isError = false,
    int duration = 600,
    double txtSize = 12.5,
    Color color = AppTheme.mainColorBlack,
    Color colorBorder = AppTheme.mainColorWhite]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppTheme.mainColorGreen,
      duration: Duration(milliseconds: duration),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      content: Directionality(
          textDirection: txtDirection(),
          child: SingleChildScrollView(
              child: xText(
                  txt: text,
                  txtSize: txtSize,
                  color: isError ? AppTheme.mainColorGreen : color))),
      elevation: xElevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: colorBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        textColor: isError ? AppTheme.mainColorGreen : color,
        label: 'موافق',
        onPressed: () => {},
      ),
    ),
  );
}

void xSnackBarWithOutDuration(BuildContext context, String text,
    [bool isError = false,
    double txtSize = 12.5,
    Color color = AppTheme.mainColorWhite,
    Color colorBorder = AppTheme.mainColorWhite]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      content: Directionality(
          textDirection: txtDirection(),
          child: SingleChildScrollView(
              child: xText(
                  txt: text,
                  txtSize: txtSize,
                  color: isError ? AppTheme.mainColorRed : color))),
      elevation: xElevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: colorBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        textColor: isError ? AppTheme.mainColorRed : color,
        label: 'موافق',
        onPressed: () => {},
      ),
    ),
  );
}

Widget xHomeScaffold({
  GlobalKey<ScaffoldState>? key,
  BuildContext? context,
  Widget? widget,
  bool withBar = true,
  bool onClickBack = false,
}) {
  return WillPopScope(
    onWillPop: () async => onClickBack,
    child: Directionality(
        textDirection: txtDirection(),
        child: Scaffold(
          backgroundColor: AppTheme.mainColorWhite,
          key: key,
          appBar: AppBar(),
          body: xLayoutBuilder(widget: widget),
        )),
  );
}

Widget xLayoutBuilder(
    {Widget? widget, double convHeight = 1, double convWidth = 1}) {
  final double minHeight = height! * convHeight;
  final double maxHeight = height! * convHeight;
  final double minWidth = width! * convWidth;
  final double maxWidth = width! * convWidth;
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        height: double.infinity,
        constraints: BoxConstraints(
            minHeight: minHeight,
            maxHeight: maxHeight,
            minWidth: minWidth,
            maxWidth: maxWidth),
        child: widget,
      );
    },
  );
}

Widget xAnimatedOpacity(Widget widget) {
  return AnimatedOpacity(
    duration: const Duration(milliseconds: 500),
    opacity: 1.0,
    child: widget,
  );
}

Widget xImage({
  String image = '',
  BoxFit boxFit = BoxFit.fitHeight,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            alignment: Alignment.center,
            onError: (exception, stackTrace) {},
            fit: boxFit,
            image: NetworkImage(image))),
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

int hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff$hex' : hex;
  final int val = int.parse(hex, radix: 16);
  return val;
}
