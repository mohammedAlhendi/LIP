import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/my_data.dart';
import 'package:train/system/train_persons.dart';
import 'package:train/ui/payment_screen.dart';

// ignore: must_be_immutable
class PersonInfoScreen extends StatefulWidget {
  PersonInfoScreen(this.persons, {Key? key}) : super(key: key);
  TrainPersons persons;

  @override
  State<PersonInfoScreen> createState() => _PersonInfoScreenState();
}

class _PersonInfoScreenState extends State<PersonInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> listTextEditingControllerFirstName = [];
  List<TextEditingController> listTextEditingControllerLastName = [];
  List<TextEditingController> listTextEditingControllerDate = [];
  List<TextEditingController> listTextEditingControllerDocumentNo = [];
  List<TextEditingController> listTextEditingControllerPhoneNo = [];
  List<TextEditingController> listTextEditingControllerCountry = [];

  String _sex = 'ذكر';
  String _documentType = 'الهوية الوطنية';
  String _phoneNo = '';
  String _zipCode = 'SA';
  String _zipCodeNew = 'Saudi Arabia';
  String _nationality = 'Saudi Arabia';
  bool isCheckApprove = false;

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    listTextEditingControllerFirstName = [
      for (int i = 0; i < widget.persons.countPerson; i++)
        TextEditingController(text: '')
    ];
    listTextEditingControllerLastName = [
      for (int i = 0; i < widget.persons.countPerson; i++)
        TextEditingController(text: '')
    ];
    listTextEditingControllerDate = [
      for (int i = 0; i < widget.persons.countPerson; i++)
        TextEditingController(text: '')
    ];
    listTextEditingControllerDocumentNo = [
      for (int i = 0; i < widget.persons.countPerson; i++)
        TextEditingController(text: '')
    ];
    listTextEditingControllerPhoneNo = [
      for (int i = 0; i < widget.persons.countPerson; i++)
        TextEditingController(text: '')
    ];
    listTextEditingControllerCountry = [
      for (int i = 0; i < widget.persons.countPerson; i++)
        TextEditingController(text: '')
    ];
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
                                    child: Image.asset(
                                        'assets/images/logo2.png',
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
                  SizedBox(
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < widget.persons.countPerson; i++)
                            Column(
                              children: [
                                Container(
                                  height: height! * 0.08,
                                  color: AppTheme.mainColorGreen,
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.money,
                                            color: AppTheme.mainColorWhite),
                                      ),
                                      SizedBox(width: width! * 0.02),
                                      xText(
                                          txt: 'معلومات المسافر  $i',
                                          fontWeight: FontWeight.bold,
                                          txtSize: width! * 0.04,
                                          color: AppTheme.mainColorWhite),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height! * 0.02),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'الإسم الأول',
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
                                    controller:
                                        listTextEditingControllerFirstName[i],
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGrey),
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.toString().length <= 2) {
                                        return 'الرجاء إدخال الإسم الأول الصحيح.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'إسم العائلة',
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
                                    controller:
                                        listTextEditingControllerLastName[i],
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGrey),
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.toString().length <= 2) {
                                        return 'الرجاء إدخال إسم العائلة الصحيح.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'تاريخ الميلاد',
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
                                    readOnly: true,
                                    controller:
                                        listTextEditingControllerDate[i],
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGrey),
                                    onTap: () async {
                                      await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2025),
                                        builder: (context, child) {
                                          return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme:
                                                    const ColorScheme.light(
                                                  primary:
                                                      AppTheme.mainColorGreen,
                                                  onPrimary: Colors.white,
                                                  onSurface: Colors.black,
                                                ),
                                                textButtonTheme:
                                                    TextButtonThemeData(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors
                                                        .red, // button text color
                                                  ),
                                                ),
                                              ),
                                              child: child!);
                                        },
                                      ).then((selectedDate) {
                                        if (selectedDate != null) {
                                          listTextEditingControllerDate[i]
                                                  .text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(selectedDate);
                                        }
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'الرجاء إدخال التاريخ.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'الجنس',
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
                                  child: DropdownButton<String>(
                                    value: _sex,
                                    isExpanded: true,
                                    items: ({
                                      'ذكر',
                                      'أنثى',
                                    }).map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: xText(
                                            txt: value,
                                            txtSize: width! * 0.04,
                                            color: AppTheme.mainColorGreyDark),
                                      );
                                    }).toList(),
                                    // Step 5.
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _sex = newValue!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'نوع الوثيقة',
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
                                  child: DropdownButton<String>(
                                    value: _documentType,
                                    isExpanded: true,
                                    items: ({
                                      'الهوية الوطنية',
                                      'جواز السفر',
                                      'الإقامة',
                                    }).map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: xText(
                                            txt: value,
                                            txtSize: width! * 0.04,
                                            color: AppTheme.mainColorGreyDark),
                                      );
                                    }).toList(),
                                    // Step 5.
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _documentType = newValue!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'رقم الوثيقة',
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
                                    controller:
                                        listTextEditingControllerDocumentNo[i],
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGrey),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'الرجاء إدخال رقم الوثيقة.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'الجنسية',
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
                                    readOnly: true,
                                    controller:
                                        listTextEditingControllerCountry[i],
                                    style: const TextStyle(
                                        color: AppTheme.mainColorGrey),
                                    onTap: () async {
                                      showCountryPicker(
                                        context: context,
                                        exclude: <String>['KN', 'MF'],
                                        //It takes a list of country code(iso2).
                                        favorite: <String>['SA', 'JO'],
                                        countryListTheme: CountryListThemeData(
                                          flagSize: 25,
                                          backgroundColor: Colors.white,
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.blueGrey),
                                          bottomSheetHeight: height! * 0.8,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          //Optional. Styles the search field.
                                          inputDecoration: InputDecoration(
                                            labelText: 'Search',
                                            hintText: 'Start typing to search',
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: const Color(0xFF8C98A8)
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onSelect: (Country country) {
                                          setState(() {
                                            _nationality = country.name;
                                            listTextEditingControllerCountry[i]
                                                .text = _nationality;
                                          });
                                        },
                                      );
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'الرجاء إدخال التاريخ.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                // SizedBox(
                                //   height: height! * 0.08,
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: Card(
                                //       elevation: 5,
                                //       color: AppTheme.mainColorWhite,
                                //       child: InkWell(
                                //         onTap: () {
                                //           showCountryPicker(
                                //             context: context,
                                //             exclude: <String>['KN', 'MF'],
                                //             //It takes a list of country code(iso2).
                                //             favorite: <String>['SA', 'JO'],
                                //             countryListTheme:
                                //                 CountryListThemeData(
                                //               flagSize: 25,
                                //               backgroundColor: Colors.white,
                                //               textStyle: const TextStyle(
                                //                   fontSize: 16,
                                //                   color: Colors.blueGrey),
                                //               bottomSheetHeight: height! * 0.8,
                                //               borderRadius:
                                //                   const BorderRadius.only(
                                //                 topLeft: Radius.circular(20.0),
                                //                 topRight: Radius.circular(20.0),
                                //               ),
                                //               //Optional. Styles the search field.
                                //               inputDecoration: InputDecoration(
                                //                 labelText: 'Search',
                                //                 hintText:
                                //                     'Start typing to search',
                                //                 prefixIcon:
                                //                     const Icon(Icons.search),
                                //                 border: OutlineInputBorder(
                                //                   borderSide: BorderSide(
                                //                     color:
                                //                         const Color(0xFF8C98A8)
                                //                             .withOpacity(0.2),
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //             onSelect: (Country country) {
                                //               setState(() {
                                //                 _nationality =
                                //                     country.displayName;
                                //               });
                                //             },
                                //           );
                                //         },
                                //         child: Container(
                                //           alignment: Alignment.center,
                                //           child: xText(
                                //               txt: _nationality,
                                //               color: AppTheme.mainColorBlack,
                                //               txtSize: width! * 0.035),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       right: 16.0, left: 16.0),
                                //   child: IntlPhoneField(
                                //     readOnly: true,
                                //     showDropdownIcon: false,
                                //     controller:
                                //         listTextEditingControllerCountry[i],
                                //     // decoration: InputDecoration(
                                //     //   labelText: _nationality,
                                //     //   border: const OutlineInputBorder(
                                //     //     borderSide: BorderSide(),
                                //     //   ),
                                //     // ),
                                //     initialCountryCode: 'SA',
                                //     onCountryChanged: (country) {
                                //       _nationality = country.name;
                                //       listTextEditingControllerCountry[i].text =
                                //           country.name;
                                //     },
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16.0, left: 16.0, top: 16.0),
                                  child: Row(
                                    children: [
                                      xText(
                                          txt: 'رقم التليفون',
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
                                  child: IntlPhoneField(
                                    controller:
                                        listTextEditingControllerPhoneNo[i],
                                    decoration: const InputDecoration(
                                      labelText: 'Phone Number',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    initialCountryCode: 'SA',
                                    onChanged: (phone) {
                                      _phoneNo = phone.completeNumber
                                          .replaceAll('+', '');
                                    },
                                    onCountryChanged: (country) {
                                      _zipCode = country.code;
                                      _zipCodeNew = country.name;
                                    },
                                  ),
                                ),
                                SizedBox(height: height! * 0.01),
                              ],
                            ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  visualDensity: const VisualDensity(
                                      horizontal: -2.0, vertical: -2.0),
                                  value: isCheckApprove,
                                  onChanged: (val) {
                                    setState(() {
                                      isCheckApprove = val!;
                                    });
                                  },
                                  activeColor: AppTheme.mainColorGreen,
                                  checkColor: AppTheme.mainColorWhite,
                                ),
                                xText(
                                    txt: 'قرأت وأوافق على',
                                    color: AppTheme.mainColorGreyDark,
                                    txtSize: width! * 0.05,
                                    fontWeight: FontWeight.bold),
                                xText(
                                    txt: ' الشروط والأحكام.*',
                                    color: AppTheme.mainColorBlueAccent,
                                    txtSize: width! * 0.05,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ),
                          SizedBox(height: height! * 0.01),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, left: 16.0),
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
                                      bool validate = false;

                                      for (int i = 0;
                                          i < widget.persons.countPerson;
                                          i++) {
                                        if (listTextEditingControllerFirstName[
                                                        i]
                                                    .text
                                                    .length >
                                                2 &&
                                            listTextEditingControllerLastName[i]
                                                    .text
                                                    .length >
                                                2 &&
                                            listTextEditingControllerDate[i]
                                                .text
                                                .toString()
                                                .trim()
                                                .contains('-') &&
                                            listTextEditingControllerDocumentNo[
                                                        i]
                                                    .text
                                                    .length >
                                                3 &&
                                            listTextEditingControllerPhoneNo[i]
                                                    .text
                                                    .length >
                                                6 &&
                                            listTextEditingControllerCountry[i]
                                                    .text
                                                    .length >
                                                3) {
                                          validate = true;
                                        }
                                      }

                                      if (isCheckApprove && validate) {
                                        MyData myData = MyData();
                                        myData.dateTime1 =
                                            '${listTextEditingControllerDate[0].text}تاريخ الميلاد ';
                                        myData.dateTime2 = '';
                                        myData.dateTime3 = '';
                                        myData.dateTime4 = '';
                                        myData.dateTime5 = '';
                                        myData.d1 =
                                            'الإسم الأول - ${listTextEditingControllerFirstName[0].text}';
                                        myData.d2 =
                                            'الإسم الأخير - ${listTextEditingControllerLastName[0].text}';
                                        myData.d3 =
                                            'رقم الوثيقة - ${listTextEditingControllerDocumentNo[0].text}';
                                        myData.d4 = 'رقم الهاتف - $_phoneNo';
                                        myData.d5 = 'الجنس - $_sex';
                                        myData.d6 =
                                            'نوع الوثيقة - $_documentType';
                                        myData.d7 = 'الجنسية - $_nationality';
                                        myData.d8 =
                                            'رمز الدولة - ${'$_zipCode $_zipCodeNew'}';
                                        myData.d9 = '';
                                        myData.d10 = '';
                                        myData.d11 = '';
                                        myData.d12 = '';
                                        myData.d13 = '';
                                        myData.d14 = '';
                                        myData.d15 = '';
                                        myData.d16 = '';
                                        myData.d17 = '';
                                        myData.d18 = '';
                                        myData.d19 = '';
                                        myData.d20 = '';
                                        myData.d21 = '';
                                        myData.d22 = '';
                                        myData.d23 = '';
                                        myData.d24 = '';
                                        myData.d25 = '';
                                        saveMyData(myData);
                                        pushScreen(
                                            context,
                                            PaymentScreen(
                                                widget.persons, myData),
                                            'push');
                                        xShowGeneralDialog(context,
                                            const Duration(seconds: 2));
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: xText(
                                          txt: 'متابعة',
                                          color: AppTheme.mainColorWhite,
                                          txtSize: width! * 0.05,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                              height: height! * 0.01,
                              color: AppTheme.mainColorGrey,
                              thickness: 1),
                          SizedBox(height: height! * 0.5),
                        ],
                      ),
                    ),
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
