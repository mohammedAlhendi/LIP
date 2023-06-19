import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/check_box_sort_programs.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/number_stepper.dart';
import 'package:train/system/train_persons.dart';
import 'package:train/ui/details_train_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  List<CheckBoxSortPrograms> cbSort = CheckBoxSortPrograms.getList();
  TextEditingController _countPerson = TextEditingController(text: '');
  final TrainPersons _persons = TrainPersons(
      countPerson: 1,
      selectedYoung: 1,
      selectedYoungWithChair: 0,
      selectedYoungCompanion: 0,
      selectedChild: 0,
      selectedChildWithChair: 0,
      selectedChildCompanion: 0,
      selectedBaby: 0,
      amount: 0.0);
  String dropdownValueFrom = 'من';
  String dropdownValueTo = 'إلى';
  final _dateController = TextEditingController(text: 'يوم/شهر/سنة');

  bool withChair = false;
  Set<SeatNumber> selectedSeats = {};
  bool clickSearchBtn = false;

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    clickSearchBtn = false;
    _countPerson = TextEditingController(text: _persons.countPerson.toString());
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
                    height: height! * 0.7,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 5,
                        child: DefaultTabController(
                          initialIndex: 0,
                          length: 2,
                          child: Scaffold(
                            backgroundColor: AppTheme.mainColorWhite,
                            appBar: AppBar(
                              toolbarHeight: height! * 0.01,
                              backgroundColor: AppTheme.mainColorWhite,
                              bottom: TabBar(
                                tabs: [
                                  Tab(
                                    child: Row(
                                      children: [
                                        MaterialButton(
                                          onPressed: null,
                                          child: Image.asset(
                                              'assets/images/tab1.png'),
                                        ),
                                        xText(
                                            txt: 'حجز جديد',
                                            fontWeight: FontWeight.bold,
                                            txtSize: width! * 0.04),
                                      ],
                                    ),
                                  ),
                                  Tab(
                                      child: xText(
                                          txt: 'إدارة الحجز',
                                          fontWeight: FontWeight.bold,
                                          txtSize: width! * 0.04)),
                                ],
                              ),
                            ),
                            body: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [tab1(), Container()]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height! * 0.05, width: width),
                  SizedBox(
                    height: height! * 0.01,
                    width: width,
                    child: Container(
                      color: AppTheme.mainColor,
                    ),
                  ),
                  SizedBox(
                    height: height! * 0.25,
                    width: width,
                    child: Container(
                      color: AppTheme.mainColorGreyDark,
                      padding: EdgeInsets.only(top: height! * 0.03),
                      child: Image.asset('assets/images/bottom_img.png'),
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

  SizedBox tab1() {
    return SizedBox(
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  xText(
                      txt: 'ذهاب فقط',
                      fontWeight: FontWeight.bold,
                      txtSize: width! * 0.04,
                      color: AppTheme.mainColorGreyDark),
                  Checkbox(
                      visualDensity:
                          const VisualDensity(horizontal: -2.0, vertical: -2.0),
                      value: cbSort[0].isCheck,
                      onChanged: (val) {
                        for (var element in cbSort) {
                          element.isCheck = false;
                        }
                        setState(() {
                          cbSort[0].isCheck = val!;
                          _dateController.text = '';
                        });
                      },
                      activeColor: AppTheme.mainColorGreen,
                      checkColor: AppTheme.mainColorWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  xText(
                      txt: 'ذهاب وعودة',
                      fontWeight: FontWeight.bold,
                      txtSize: width! * 0.04,
                      color: AppTheme.mainColorGreyDark),
                  Checkbox(
                      visualDensity:
                          const VisualDensity(horizontal: -2.0, vertical: -2.0),
                      value: cbSort[1].isCheck,
                      onChanged: (val) {
                        for (var element in cbSort) {
                          element.isCheck = false;
                        }
                        setState(() {
                          cbSort[1].isCheck = val!;
                          _dateController.text = '';
                        });
                      },
                      activeColor: AppTheme.mainColorGreen,
                      checkColor: AppTheme.mainColorWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    xText(
                        txt: ' :من',
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
                SizedBox(
                  width: width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.keyboard_double_arrow_left,
                            size: width! * 0.04, color: AppTheme.mainColorGrey),
                      ),
                      SizedBox(
                        width: width! * 0.9,
                        child: DropdownButton<String>(
                          value: dropdownValueFrom,
                          isExpanded: true,
                          items: (dropdownValueTo == 'مكة المكرمة'
                                  ? {
                                      'من',
                                      'السليمانية - جدة',
                                      'مدينة الملك عبدالله الاقتصادية',
                                      'المطار- جدة',
                                      'المدينة المنورة'
                                    }
                                  : dropdownValueTo == 'السليمانية - جدة'
                                      ? {
                                          'من',
                                          'مكة المكرمة',
                                          'مدينة الملك عبدالله الاقتصادية',
                                          'المطار- جدة',
                                          'المدينة المنورة'
                                        }
                                      : dropdownValueTo ==
                                              'مدينة الملك عبدالله الاقتصادية'
                                          ? {
                                              'من',
                                              'مكة المكرمة',
                                              'السليمانية - جدة',
                                              'المطار- جدة',
                                              'المدينة المنورة'
                                            }
                                          : dropdownValueTo == 'المطار- جدة'
                                              ? {
                                                  'من',
                                                  'مكة المكرمة',
                                                  'السليمانية - جدة',
                                                  'مدينة الملك عبدالله الاقتصادية',
                                                  'المدينة المنورة'
                                                }
                                              : dropdownValueTo ==
                                                      'المدينة المنورة'
                                                  ? {
                                                      'من',
                                                      'مكة المكرمة',
                                                      'السليمانية - جدة',
                                                      'مدينة الملك عبدالله الاقتصادية',
                                                      'المطار- جدة',
                                                    }
                                                  : {
                                                      'من',
                                                      'مكة المكرمة',
                                                      'السليمانية - جدة',
                                                      'مدينة الملك عبدالله الاقتصادية',
                                                      'المطار- جدة',
                                                      'المدينة المنورة'
                                                    })
                              .map<DropdownMenuItem<String>>((String value) {
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
                              dropdownValueFrom = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    xText(
                        txt: ' :إلى',
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
                SizedBox(
                  width: width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.location_on_outlined,
                            size: width! * 0.04, color: AppTheme.mainColorGrey),
                      ),
                      SizedBox(
                        width: width! * 0.9,
                        child: DropdownButton<String>(
                          value: dropdownValueTo,
                          isExpanded: true,
                          items: (dropdownValueFrom == 'مكة المكرمة'
                                  ? {
                                      'إلى',
                                      'السليمانية - جدة',
                                      'مدينة الملك عبدالله الاقتصادية',
                                      'المطار- جدة',
                                      'المدينة المنورة'
                                    }
                                  : dropdownValueFrom == 'السليمانية - جدة'
                                      ? {
                                          'إلى',
                                          'مكة المكرمة',
                                          'مدينة الملك عبدالله الاقتصادية',
                                          'المطار- جدة',
                                          'المدينة المنورة'
                                        }
                                      : dropdownValueFrom ==
                                              'مدينة الملك عبدالله الاقتصادية'
                                          ? {
                                              'إلى',
                                              'مكة المكرمة',
                                              'السليمانية - جدة',
                                              'المطار- جدة',
                                              'المدينة المنورة'
                                            }
                                          : dropdownValueFrom == 'المطار- جدة'
                                              ? {
                                                  'إلى',
                                                  'مكة المكرمة',
                                                  'السليمانية - جدة',
                                                  'مدينة الملك عبدالله الاقتصادية',
                                                  'المدينة المنورة'
                                                }
                                              : dropdownValueFrom ==
                                                      'المدينة المنورة'
                                                  ? {
                                                      'إلى',
                                                      'مكة المكرمة',
                                                      'السليمانية - جدة',
                                                      'مدينة الملك عبدالله الاقتصادية',
                                                      'المطار- جدة',
                                                    }
                                                  : {
                                                      'إلى',
                                                      'مكة المكرمة',
                                                      'السليمانية - جدة',
                                                      'مدينة الملك عبدالله الاقتصادية',
                                                      'المطار- جدة',
                                                      'المدينة المنورة'
                                                    })
                              .map<DropdownMenuItem<String>>((String value) {
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
                              dropdownValueTo = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    xText(
                        txt: ' متى السفر',
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
                TextFormField(
                  readOnly: true,
                  controller: _dateController,
                  style: const TextStyle(color: AppTheme.mainColorGrey),
                  // decoration: const InputDecoration(
                  //   labelText: 'يوم/شهر/سنة',
                  //   labelStyle: TextStyle(color: AppTheme.mainColorGrey)
                  // ),
                  onTap: () async {
                    cbSort.first.isCheck
                        ? await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            builder: (context, child) {
                              return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: AppTheme.mainColorGreen,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary:
                                            Colors.red, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!);
                            },
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              _dateController.text =
                                  DateFormat('yyyy-MM-dd').format(selectedDate);
                            }
                          })
                        : await showDateRangePicker(
                            context: context,
                            initialDateRange: DateTimeRange(
                                start: DateTime.now(), end: DateTime.now()),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            builder: (context, child) {
                              return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: AppTheme.mainColorGreen,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary:
                                            Colors.red, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!);
                            },
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              _dateController.text =
                                  ' من${DateFormat('yyyy-MM-dd').format(selectedDate.start)} إلى ${DateFormat('yyyy-MM-dd').format(selectedDate.end)}';
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
                Row(
                  children: [
                    xText(
                        txt: ' الضيوف',
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
                dialogNumPassengers(),
                SizedBox(
                    height: height! * 0.1,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: AppTheme.mainColorGreen,
                        child: InkWell(
                          onTap: () {
                            if (_dateController.text == 'يوم/شهر/سنة') {
                              _dateController.text = '';
                            }
                            if (_formKey.currentState!.validate()) {}
                            if (dropdownValueFrom.length > 4 &&
                                dropdownValueTo.length > 4 &&
                                _dateController.text
                                    .toString()
                                    .trim()
                                    .contains('-') &&
                                _countPerson.text != '0') {
                              clickSearchBtn = true;
                              pushScreen(
                                  context,
                                  DetailsTrainScreen(
                                      clickSearchBtn,
                                      dropdownValueFrom,
                                      dropdownValueTo,
                                      cbSort,
                                      _dateController.text,
                                      _persons),
                                  'push');
                              Timer(const Duration(seconds: 4), () {
                                showImageBagDialog(context);
                              });
                              xShowGeneralDialog(
                                  context, const Duration(seconds: 3));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: xText(
                                txt: 'البحث',
                                color: AppTheme.mainColorBlack,
                                txtSize: width! * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField dialogNumPassengers() {
    return TextFormField(
      readOnly: true,
      controller: _countPerson,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppTheme.mainColorGrey),
          labelText: _persons.selectedYoung > 0 ||
                  _persons.selectedChild > 0 ||
                  _persons.selectedBaby > 0
              ? 'الضيوف'
              : 'البالغين',
          icon: const Icon(Icons.man, color: AppTheme.mainColorGrey)),
      onTap: () async {
        showDialog<void>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(8),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: withChair ? height! * 0.6 : height! * 0.4,
                  width: width,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NumberStepper(
                                  initialValue: _persons.selectedYoung,
                                  min: 0,
                                  max: 10,
                                  step: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      _persons.selectedYoung = value;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      xText(
                                          txt: 'البالغين',
                                          color: AppTheme.mainColorGreyDark,
                                          txtSize: width! * 0.03,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center),
                                      xText(
                                          txt:
                                              '         (12+ العمر ):         ',
                                          color: AppTheme.mainColorGreyDark,
                                          txtSize: width! * 0.02,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                  const Icon(Icons.man,
                                      color: AppTheme.mainColorGreyDark),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: height! * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NumberStepper(
                                  initialValue: _persons.selectedChild,
                                  min: 0,
                                  max: 10,
                                  step: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      _persons.selectedChild = value;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      xText(
                                          txt: 'الأطفال',
                                          color: AppTheme.mainColorGreyDark,
                                          txtSize: width! * 0.03,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center),
                                      xText(
                                          txt: 'العمر 0 -12 ) مع مقعد):',
                                          color: AppTheme.mainColorGreyDark,
                                          txtSize: width! * 0.02,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                  const Icon(Icons.boy,
                                      color: AppTheme.mainColorGreyDark),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: height! * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NumberStepper(
                                  initialValue: _persons.selectedBaby,
                                  min: 0,
                                  max: 10,
                                  step: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      _persons.selectedBaby = value;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          xText(
                                              txt: 'الرضع',
                                              color: AppTheme.mainColorGreyDark,
                                              txtSize: width! * 0.03,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center),
                                        ],
                                      ),
                                      xText(
                                          txt: 'لا يشغل مقعداً (0-2 العمر):',
                                          color: AppTheme.mainColorGreyDark,
                                          txtSize: width! * 0.02,
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                  const Icon(Icons.boy,
                                      color: AppTheme.mainColorGreyDark),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: height! * 0.01),
                          const Divider(
                              thickness: 0.5, color: AppTheme.mainColorGrey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.warning_amber,
                                  color: AppTheme.mainColorGreen),
                              xText(
                                  txt: 'مساحة كرسي متحرك لذوي الهمم',
                                  color: AppTheme.mainColorGreyDark,
                                  txtSize: width! * 0.03,
                                  textAlign: TextAlign.center),
                              Checkbox(
                                value: withChair,
                                onChanged: (val) {
                                  setState(() {
                                    withChair = val!;
                                  });
                                },
                                activeColor: AppTheme.mainColorGreen,
                              ),
                              const Icon(Icons.wheelchair_pickup,
                                  color: AppTheme.mainColorGreyDark),
                            ],
                          ),
                          const Divider(
                              thickness: 0.5, color: AppTheme.mainColorGrey),
                          SizedBox(height: height! * 0.01),
                          withChair
                              ? xText(
                                  txt:
                                      '(حدد ما إذا كان لديك أي نوع من أنواع الإعاقة)',
                                  color: AppTheme.mainColorGreyDark,
                                  txtSize: width! * 0.03,
                                  textAlign: TextAlign.center)
                              : Container(),
                          withChair
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NumberStepper(
                                        initialValue:
                                            _persons.selectedYoungWithChair,
                                        min: 0,
                                        max: 10,
                                        step: 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _persons.selectedYoungWithChair =
                                                value;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            xText(
                                                txt: 'مساحة كرسي متحرك',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.03,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center),
                                            xText(
                                                txt: 'لذوي الإعاقة البالغين',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.03,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        const Icon(Icons.wheelchair_pickup,
                                            color: AppTheme.mainColorGreyDark),
                                      ],
                                    )
                                  ],
                                )
                              : Container(),
                          withChair
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NumberStepper(
                                        initialValue:
                                            _persons.selectedYoungCompanion,
                                        min: 0,
                                        max: 10,
                                        step: 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _persons.selectedYoungCompanion =
                                                value;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            xText(
                                                txt: 'مرافق',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.03,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center),
                                            xText(
                                                txt:
                                                    '         البالغين         ',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.02,
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        const Icon(Icons.wheelchair_pickup,
                                            color: AppTheme.mainColorGreyDark),
                                      ],
                                    )
                                  ],
                                )
                              : Container(),
                          withChair
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NumberStepper(
                                        initialValue:
                                            _persons.selectedChildWithChair,
                                        min: 0,
                                        max: 10,
                                        step: 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _persons.selectedChildWithChair =
                                                value;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            xText(
                                                txt: 'مساحة كرسي متحرك',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.03,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center),
                                            xText(
                                                txt: 'لذوي الإعاقة الأطفال',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.03,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        const Icon(Icons.wheelchair_pickup,
                                            color: AppTheme.mainColorGreyDark),
                                      ],
                                    )
                                  ],
                                )
                              : Container(),
                          withChair
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NumberStepper(
                                        initialValue:
                                            _persons.selectedChildCompanion,
                                        min: 0,
                                        max: 10,
                                        step: 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _persons.selectedChildCompanion =
                                                value;
                                          });
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            xText(
                                                txt: 'مرافق',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.03,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.center),
                                            xText(
                                                txt:
                                                    '         الأطفال         ',
                                                color:
                                                    AppTheme.mainColorGreyDark,
                                                txtSize: width! * 0.02,
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        const Icon(Icons.wheelchair_pickup,
                                            color: AppTheme.mainColorGreyDark),
                                      ],
                                    )
                                  ],
                                )
                              : Container(),
                          SizedBox(
                              height: height! * 0.07,
                              width: width,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Material(
                                  color: AppTheme.mainColorGreen,
                                  child: InkWell(
                                    onTap: () {
                                      if (!withChair) {
                                        _persons.selectedYoungWithChair = 0;
                                        _persons.selectedYoungCompanion = 0;
                                        _persons.selectedChildWithChair = 0;
                                        _persons.selectedChildCompanion = 0;
                                      }
                                      _countPerson.text = (_persons
                                                  .selectedYoung +
                                              _persons.selectedChild +
                                              _persons.selectedBaby +
                                              _persons.selectedYoungWithChair +
                                              _persons.selectedYoungCompanion +
                                              _persons.selectedChildWithChair +
                                              _persons.selectedChildCompanion)
                                          .toString();
                                      _persons.countPerson =
                                          int.parse(_countPerson.text);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: xText(
                                          txt: 'إختار',
                                          color: AppTheme.mainColorWhite,
                                          txtSize: width! * 0.04,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        );
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إختيار الضيوف.';
        }
        return null;
      },
    );
  }
}

void showImageBagDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Image.asset('assets/images/bag.png'),
        actions: [
          Center(
            child: SizedBox(
                height: height! * 0.1,
                width: width! * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    color: AppTheme.mainColorGreen,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: xText(
                            txt: 'أتفهم ذلك',
                            color: AppTheme.mainColorWhite,
                            txtSize: width! * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      );
    },
  );
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == (other).colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}
