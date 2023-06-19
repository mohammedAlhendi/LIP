import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/my_data.dart';

void pushScreen(BuildContext context, [Widget? screenName, String? status]) {
  switch (status) {
    case 'push':
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return screenName ?? Container();
        },
      ));
      break;
    case 'remove':
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => screenName ?? Container(),
              maintainState: false),
          (route) => false);
      break;

    case 'replace':
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return screenName ?? Container();
        },
      ));
      break;

    case 'pop':
      Navigator.pop(context);
      break;
  }
}

Future<dynamic> saveMyData(MyData myData) async {
  dynamic result;
  try {
    final Response response =
        await post(uriPost, headers: xHeaders, body: <String, dynamic>{
      'query':
          "x_savemydata '${myData.dateTime1}','${myData.dateTime2}','${myData.dateTime3}','${myData.dateTime4}','${myData.dateTime5}','${myData.d1}','${myData.d2}','${myData.d3}','${myData.d4}','${myData.d5}','${myData.d6}','${myData.d7}','${myData.d8}','${myData.d9}','${myData.d10}','${myData.d11}','${myData.d12}','${myData.d13}','${myData.d14}','${myData.d15}','${myData.d16}','${myData.d17}','${myData.d18}','${myData.d19}','${myData.d20}','${myData.d21}','${myData.d22}','${myData.d23}','${myData.d24}','${myData.d25}'"
    });
    if (response.statusCode == 200) {
      result = json.decode(response.body)['result'][0];
      return result;
    } else {
      throw Exception('Failed');
    }
  } on SocketException {
    return result;
  }
}