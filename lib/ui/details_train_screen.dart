import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/check_box_sort_programs.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/time_train.dart';
import 'package:train/system/time_train_price.dart';
import 'package:train/system/train_persons.dart';
import 'package:train/ui/chair_train_screen.dart';

// ignore: must_be_immutable
class DetailsTrainScreen extends StatefulWidget {
  DetailsTrainScreen(this.clickSearchBtn, this.from, this.to, this.cbSort,
      this.date, this.persons,
      {Key? key})
      : super(key: key);

  bool clickSearchBtn;
  String from;
  String to;
  List<CheckBoxSortPrograms> cbSort;
  String date;
  TrainPersons persons;

  @override
  State<DetailsTrainScreen> createState() => _DetailsTrainScreenState();
}

class _DetailsTrainScreenState extends State<DetailsTrainScreen> {
  final List<TimeTrain> _timeTrainOneWay = [];
  final List<TimeTrain> _timeTrainRoundTrip = [];
  final List<TimeTrainPrice> _listTime = [];

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    _listTime.add(TimeTrainPrice(
        seq: 21,
        name: 'مكة المكرمة-السليمانية - جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 28)),
        price: 60.38,
        priceWithDisc: 46.00));
    _listTime.add(TimeTrainPrice(
        seq: 31,
        name: 'مكة المكرمة-مدينة الملك عبدالله الاقتصادية',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 64)),
        price: 201.25,
        priceWithDisc: 126.50));
    _listTime.add(TimeTrainPrice(
        seq: 41,
        name: 'مكة المكرمة-المطار- جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 54)),
        price: 81.94,
        priceWithDisc: 69.00));
    _listTime.add(TimeTrainPrice(
        seq: 51,
        name: 'مكة المكرمة-المدينة المنورة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 145)),
        price: 275.31,
        priceWithDisc: 224.25));
    _listTime.add(TimeTrainPrice(
        seq: 12,
        name: 'السليمانية - جدة-مكة المكرمة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 35)),
        price: 60.38,
        priceWithDisc: 46.00));
    _listTime.add(TimeTrainPrice(
        seq: 32,
        name: 'السليمانية - جدة-مدينة الملك عبدالله الاقتصادية',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 32)),
        price: 97.75,
        priceWithDisc: 86.25));
    _listTime.add(TimeTrainPrice(
        seq: 42,
        name: 'السليمانية - جدة-المطار- جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 20)),
        price: 38.81,
        priceWithDisc: 14.95));
    _listTime.add(TimeTrainPrice(
        seq: 52,
        name: 'السليمانية - جدة-المدينة المنورة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 108)),
        price: 237.19,
        priceWithDisc: 189.75));
    _listTime.add(TimeTrainPrice(
        seq: 13,
        name: 'مدينة الملك عبدالله الاقتصادية-مكة المكرمة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 72)),
        price: 201.25,
        priceWithDisc: 126.50));
    _listTime.add(TimeTrainPrice(
        seq: 23,
        name: 'مدينة الملك عبدالله الاقتصادية-السليمانية - جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 34)),
        price: 97.75,
        priceWithDisc: 74.75));
    _listTime.add(TimeTrainPrice(
        seq: 43,
        name: 'مدينة الملك عبدالله الاقتصادية-المطار- جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 43)),
        price: 97.75,
        priceWithDisc: 37.38));
    _listTime.add(TimeTrainPrice(
        seq: 53,
        name: 'مدينة الملك عبدالله الاقتصادية-المدينة المنورة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 78)),
        price: 185.44,
        priceWithDisc: 115.00));
    _listTime.add(TimeTrainPrice(
        seq: 14,
        name: 'المطار- جدة-مكة المكرمة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 54)),
        price: 81.94,
        priceWithDisc: 34.50));
    _listTime.add(TimeTrainPrice(
        seq: 24,
        name: 'المطار- جدة-السليمانية - جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 16)),
        price: 38.81,
        priceWithDisc: 14.95));
    _listTime.add(TimeTrainPrice(
        seq: 34,
        name: 'المطار- جدة-مدينة الملك عبدالله الاقتصادية',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 35)),
        price: 97.75,
        priceWithDisc: 57.50));
    _listTime.add(TimeTrainPrice(
        seq: 54,
        name: 'المطار- جدة-المدينة المنورة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 114)),
        price: 228.56,
        priceWithDisc: 172.50));
    _listTime.add(TimeTrainPrice(
        seq: 15,
        name: 'المدينة المنورة-مكة المكرمة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 145)),
        price: 275.31,
        priceWithDisc: 224.25));
    _listTime.add(TimeTrainPrice(
        seq: 25,
        name: 'المدينة المنورة-السليمانية - جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 107)),
        price: 237.19,
        priceWithDisc: 189.75));
    _listTime.add(TimeTrainPrice(
        seq: 35,
        name: 'المدينة المنورة-مدينة الملك عبدالله الاقتصادية',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 70)),
        price: 185.44,
        priceWithDisc: 74.75));
    _listTime.add(TimeTrainPrice(
        seq: 45,
        name: 'المدينة المنورة-المطار- جدة',
        duration:
            DateTime.utc(DateTime.now().hour).add(const Duration(minutes: 114)),
        price: 228.56,
        priceWithDisc: 138.00));

    for (TimeTrainPrice ttp in _listTime) {
      ttp.price = ttp.price / 1.30;
      ttp.priceWithDisc = ttp.priceWithDisc / 1.30;
    }

    Duration durationHours = Duration(
        minutes: _listTime
            .firstWhere(
                (element) => element.name == '${widget.from}-${widget.to}')
            .duration
            .hour);
    Duration durationMinutes = Duration(
        minutes: _listTime
                .firstWhere(
                    (element) => element.name == '${widget.from}-${widget.to}')
                .duration
                .minute +
            (durationHours.inMinutes * 60));
    // Duration durationMinutes = Duration(minutes: 120);
    DateTime startTime1 = DateTime.utc(DateTime.now().day);

    _timeTrainOneWay.add(TimeTrain(
        seq: 1, dateTimeTrain: startTime1, isCheck1: false, isCheck2: false));
    DateTime startTime2 =
        startTime1.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 2, dateTimeTrain: startTime2, isCheck1: false, isCheck2: false));
    DateTime startTime3 =
        startTime2.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 3, dateTimeTrain: startTime3, isCheck1: false, isCheck2: false));
    DateTime startTime4 =
        startTime3.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 4, dateTimeTrain: startTime4, isCheck1: false, isCheck2: false));
    DateTime startTime5 =
        startTime4.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 5, dateTimeTrain: startTime5, isCheck1: false, isCheck2: false));
    DateTime startTime6 =
        startTime5.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 6, dateTimeTrain: startTime6, isCheck1: false, isCheck2: false));
    DateTime startTime7 =
        startTime6.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 7, dateTimeTrain: startTime7, isCheck1: false, isCheck2: false));
    DateTime startTime8 =
        startTime7.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 8, dateTimeTrain: startTime8, isCheck1: false, isCheck2: false));
    DateTime startTime9 =
        startTime8.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 9, dateTimeTrain: startTime9, isCheck1: false, isCheck2: false));
    DateTime startTime10 =
        startTime9.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 10, dateTimeTrain: startTime10, isCheck1: false, isCheck2: false));
    DateTime startTime11 =
        startTime10.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 11, dateTimeTrain: startTime11, isCheck1: false, isCheck2: false));
    DateTime startTime12 =
        startTime11.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 12, dateTimeTrain: startTime12, isCheck1: false, isCheck2: false));
    DateTime startTime13 =
        startTime12.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 13, dateTimeTrain: startTime13, isCheck1: false, isCheck2: false));
    DateTime startTime14 =
        startTime13.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 14, dateTimeTrain: startTime14, isCheck1: false, isCheck2: false));
    DateTime startTime15 =
        startTime14.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 15, dateTimeTrain: startTime15, isCheck1: false, isCheck2: false));
    DateTime startTime16 =
        startTime15.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 16, dateTimeTrain: startTime16, isCheck1: false, isCheck2: false));
    DateTime startTime17 =
        startTime16.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 17, dateTimeTrain: startTime17, isCheck1: false, isCheck2: false));
    DateTime startTime18 =
        startTime17.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 18, dateTimeTrain: startTime18, isCheck1: false, isCheck2: false));
    DateTime startTime19 =
        startTime18.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 19, dateTimeTrain: startTime19, isCheck1: false, isCheck2: false));
    DateTime startTime20 =
        startTime19.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime20, isCheck1: false, isCheck2: false));
    DateTime startTime21 =
        startTime20.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime21, isCheck1: false, isCheck2: false));
    DateTime startTime22 =
        startTime21.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime22, isCheck1: false, isCheck2: false));
    DateTime startTime23 =
        startTime22.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime23, isCheck1: false, isCheck2: false));
    DateTime startTime24 =
        startTime23.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime24, isCheck1: false, isCheck2: false));
    DateTime startTime25 =
        startTime24.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime25, isCheck1: false, isCheck2: false));
    DateTime startTime26 =
        startTime25.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime26, isCheck1: false, isCheck2: false));
    DateTime startTime27 =
        startTime26.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime27, isCheck1: false, isCheck2: false));
    DateTime startTime28 =
        startTime27.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20, dateTimeTrain: startTime28, isCheck1: false, isCheck2: false));

    DateTime startTimeR1 = DateTime.utc(DateTime.now().day);
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 1, dateTimeTrain: startTimeR1, isCheck1: false, isCheck2: false));
    DateTime startTimeR2 =
        startTimeR1.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 2, dateTimeTrain: startTimeR2, isCheck1: false, isCheck2: false));
    DateTime startTimeR3 =
        startTimeR2.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 3, dateTimeTrain: startTimeR3, isCheck1: false, isCheck2: false));
    DateTime startTimeR4 =
        startTimeR3.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 4, dateTimeTrain: startTimeR4, isCheck1: false, isCheck2: false));
    DateTime startTimeR5 =
        startTimeR4.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 5, dateTimeTrain: startTimeR5, isCheck1: false, isCheck2: false));
    DateTime startTimeR6 =
        startTimeR5.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 6, dateTimeTrain: startTimeR6, isCheck1: false, isCheck2: false));
    DateTime startTimeR7 =
        startTimeR6.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 7, dateTimeTrain: startTimeR7, isCheck1: false, isCheck2: false));
    DateTime startTimeR8 =
        startTimeR7.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 8, dateTimeTrain: startTimeR8, isCheck1: false, isCheck2: false));
    DateTime startTimeR9 =
        startTimeR8.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 9, dateTimeTrain: startTimeR9, isCheck1: false, isCheck2: false));
    DateTime startTimeR10 =
        startTimeR9.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 10,
        dateTimeTrain: startTimeR10,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR11 =
        startTimeR10.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 11,
        dateTimeTrain: startTimeR11,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR12 =
        startTimeR11.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 12,
        dateTimeTrain: startTimeR12,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR13 =
        startTimeR12.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 13,
        dateTimeTrain: startTimeR13,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR14 =
        startTimeR13.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 14,
        dateTimeTrain: startTimeR14,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR15 =
        startTimeR14.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 15,
        dateTimeTrain: startTimeR15,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR16 =
        startTimeR15.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 16,
        dateTimeTrain: startTimeR16,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR17 =
        startTimeR16.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 17,
        dateTimeTrain: startTimeR17,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR18 =
        startTimeR17.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 18,
        dateTimeTrain: startTimeR18,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR19 =
        startTimeR18.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 19,
        dateTimeTrain: startTimeR19,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR20 =
        startTimeR19.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainRoundTrip.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR20,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR21 =
        startTimeR20.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR21,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR22 =
        startTimeR21.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR22,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR23 =
        startTimeR22.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR23,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR24 =
        startTimeR23.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR24,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR25 =
        startTimeR24.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR25,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR26 =
        startTimeR25.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR26,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR27 =
        startTimeR26.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR27,
        isCheck1: false,
        isCheck2: false));
    DateTime startTimeR28 =
        startTimeR27.add(Duration(minutes: durationMinutes.inMinutes));
    _timeTrainOneWay.add(TimeTrain(
        seq: 20,
        dateTimeTrain: startTimeR28,
        isCheck1: false,
        isCheck2: false));
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
    return Scaffold(
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
                SizedBox(
                  height: height! * 0.9,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 5,
                      child: details(),
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
    );
  }

  SizedBox details() {
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
                      value: widget.cbSort[0].isCheck,
                      onChanged: (val) {},
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
                      value: widget.cbSort[1].isCheck,
                      onChanged: (val) {},
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.keyboard_double_arrow_left,
                          size: width! * 0.04, color: AppTheme.mainColorGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: xText(
                          txt: widget.from,
                          txtSize: width! * 0.04,
                          color: AppTheme.mainColorGrey),
                    ),
                  ],
                ),
                const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: AppTheme.mainColorGreylight,
                    thickness: 3),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.location_on_outlined,
                          size: width! * 0.04, color: AppTheme.mainColorGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: xText(
                          txt: widget.to,
                          txtSize: width! * 0.04,
                          color: AppTheme.mainColorGrey),
                    ),
                  ],
                ),
                const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: AppTheme.mainColorGreylight,
                    thickness: 3),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.event_note_outlined,
                          size: width! * 0.04, color: AppTheme.mainColorGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: xText(
                          txt: widget.date,
                          txtSize: width! * 0.04,
                          color: AppTheme.mainColorGrey),
                    ),
                  ],
                ),
                const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: AppTheme.mainColorGreylight,
                    thickness: 3),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.family_restroom,
                          size: width! * 0.04, color: AppTheme.mainColorGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: xText(
                          txt: widget.persons.countPerson,
                          txtSize: width! * 0.04,
                          color: AppTheme.mainColorGrey),
                    ),
                  ],
                ),
                const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: AppTheme.mainColorGreylight,
                    thickness: 3),
                SizedBox(
                    height: height! * 0.1,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        color: AppTheme.mainColorGreen,
                        child: InkWell(
                          onTap: () {
                            widget.clickSearchBtn = true;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: xText(
                                txt: 'البحث',
                                color: AppTheme.mainColorWhite,
                                txtSize: width! * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Divider(
                    height: height! * 0.01,
                    color: AppTheme.mainColorGrey,
                    thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.time_to_leave,
                              color: AppTheme.mainColorGreyDark),
                          xText(
                              txt: 'الذهاب:',
                              txtSize: width! * 0.04,
                              color: AppTheme.mainColorGreen,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                      xText(
                          txt: widget.from,
                          txtSize: width! * 0.04,
                          color: AppTheme.mainColorGreen,
                          fontWeight: FontWeight.bold),
                      const Icon(Icons.arrow_right,
                          color: AppTheme.mainColorGreen),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      xText(
                          txt: widget.to,
                          txtSize: width! * 0.04,
                          color: AppTheme.mainColorGreen,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                Divider(
                    height: height! * 0.01,
                    color: AppTheme.mainColorGrey,
                    thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(Icons.time_to_leave,
                                color: AppTheme.mainColorGreyDark),
                            xText(txt: 'وقت المغادرة'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(Icons.time_to_leave_outlined,
                                color: AppTheme.mainColorGreyDark),
                            xText(txt: 'وقت الوصول'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(Icons.access_time_outlined,
                                color: AppTheme.mainColorGreyDark),
                            xText(txt: 'المدة'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset('assets/images/tab1.png'),
                            xText(txt: 'رقم القطار'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                rowTimeTrainOneWay(),
                Divider(
                    height: height! * 0.01,
                    color: AppTheme.mainColorGrey,
                    thickness: 1),
                if (widget.cbSort[1].isCheck)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.time_to_leave,
                                color: AppTheme.mainColorGreyDark),
                            xText(
                                txt: 'العودة:',
                                txtSize: width! * 0.04,
                                color: AppTheme.mainColorGreen,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        xText(
                            txt: widget.to,
                            txtSize: width! * 0.04,
                            color: AppTheme.mainColorGreen,
                            fontWeight: FontWeight.bold),
                        const Icon(Icons.arrow_right,
                            color: AppTheme.mainColorGreen),
                      ],
                    ),
                  ),
                if (widget.cbSort[1].isCheck)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        xText(
                            txt: widget.from,
                            txtSize: width! * 0.04,
                            color: AppTheme.mainColorGreen,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                if (widget.cbSort[1].isCheck)
                  Divider(
                      height: height! * 0.01,
                      color: AppTheme.mainColorGrey,
                      thickness: 1),
                if (widget.cbSort[1].isCheck)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(Icons.time_to_leave,
                                  color: AppTheme.mainColorGreyDark),
                              xText(txt: 'وقت المغادرة'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(Icons.time_to_leave_outlined,
                                  color: AppTheme.mainColorGreyDark),
                              xText(txt: 'وقت الوصول'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(Icons.access_time_outlined,
                                  color: AppTheme.mainColorGreyDark),
                              xText(txt: 'المدة'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/tab1.png'),
                              xText(txt: 'رقم القطار'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.cbSort[1].isCheck) rowTimeTrainRoundTrip(),
                if (widget.cbSort[1].isCheck)
                  Divider(
                      height: height! * 0.01,
                      color: AppTheme.mainColorGrey,
                      thickness: 1),
                SizedBox(
                    height: height! * 0.1,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        color: AppTheme.mainColorGreen,
                        child: InkWell(
                          onTap: () {
                            bool isCheck = false;
                            bool isCheckRoundTrip = false;
                            widget.persons.amount = 0;
                            if (widget.cbSort[0].isCheck) {
                              for (TimeTrain tt in _timeTrainOneWay) {
                                if (tt.isCheck1 || tt.isCheck2) {
                                  isCheck = true;
                                  if (isCheck) {
                                    tt.isCheck1
                                        ? widget.persons.amount += _listTime
                                                .firstWhere((element) =>
                                                    element.name ==
                                                    '${widget.from}-${widget.to}')
                                                .price *
                                            widget.persons.countPerson
                                        : widget.persons.amount += _listTime
                                                .firstWhere((element) =>
                                                    element.name ==
                                                    '${widget.from}-${widget.to}')
                                                .priceWithDisc *
                                            widget.persons.countPerson;
                                  }
                                }
                              }
                            }
                            if (widget.cbSort[1].isCheck) {
                              for (TimeTrain tt in _timeTrainOneWay) {
                                if (tt.isCheck1 || tt.isCheck2) {
                                  isCheck = true;
                                  if (isCheck) {
                                    tt.isCheck1
                                        ? widget.persons.amount += _listTime
                                                .firstWhere((element) =>
                                                    element.name ==
                                                    '${widget.from}-${widget.to}')
                                                .price *
                                            widget.persons.countPerson
                                        : widget.persons.amount += _listTime
                                                .firstWhere((element) =>
                                                    element.name ==
                                                    '${widget.from}-${widget.to}')
                                                .priceWithDisc *
                                            widget.persons.countPerson;
                                  }
                                }
                              }
                              for (TimeTrain tt in _timeTrainRoundTrip) {
                                if (tt.isCheck1 || tt.isCheck2) {
                                  isCheckRoundTrip = true;
                                  if (isCheck) {
                                    tt.isCheck1
                                        ? widget.persons.amount += _listTime
                                                .firstWhere((element) =>
                                                    element.name ==
                                                    '${widget.from}-${widget.to}')
                                                .price *
                                            widget.persons.countPerson
                                        : widget.persons.amount += _listTime
                                                .firstWhere((element) =>
                                                    element.name ==
                                                    '${widget.from}-${widget.to}')
                                                .priceWithDisc *
                                            widget.persons.countPerson;
                                  }
                                }
                              }
                            }
                            if (!widget.cbSort[1].isCheck) {
                              isCheckRoundTrip = true;
                            }
                            if (isCheck && isCheckRoundTrip) {
                              pushScreen(context,
                                  ChairTrainScreen(widget.persons), 'push');
                              xShowGeneralDialog(
                                  context, const Duration(seconds: 2));
                            } else {
                              xSnackBar(context, 'يجب التحديد للإستمرار');
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: xText(
                                txt: 'إستمر',
                                color: AppTheme.mainColorWhite,
                                txtSize: width! * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Divider(
                    height: height! * 0.02,
                    color: AppTheme.mainColorGrey,
                    thickness: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget rowTimeTrainOneWay() {
    return Column(
      children: [
        for (var i = 3; i < 27; i++)
          Column(
            children: [
              Divider(
                  height: height! * 0.01,
                  color: AppTheme.mainColorGrey,
                  thickness: 1),
              ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    xText(
                        txt:
                            'H ${DateFormat('HH:mm').format(_timeTrainOneWay[i].dateTimeTrain)}',
                        color: AppTheme.mainColorGrey),
                    xText(
                        txt:
                            'H ${DateFormat('HH:mm').format(_timeTrainOneWay[i + 1].dateTimeTrain)}',
                        color: AppTheme.mainColorGrey),
                    Row(
                      children: [
                        xText(
                            txt: DateFormat('HH').format(_listTime
                                .firstWhere((element) =>
                                    element.name ==
                                    '${widget.from}-${widget.to}')
                                .duration),
                            color: AppTheme.mainColorGrey),
                        xText(txt: 'س', color: AppTheme.mainColorGrey),
                        xText(
                            txt: DateFormat('mm').format(_listTime
                                .firstWhere((element) =>
                                    element.name ==
                                    '${widget.from}-${widget.to}')
                                .duration),
                            color: AppTheme.mainColorGrey),
                        xText(txt: 'د ', color: AppTheme.mainColorGrey),
                      ],
                    ),
                    Column(
                      children: [
                        xText(txt: '052$i', color: AppTheme.mainColorGrey),
                        xText(
                            txt: '1 توقف',
                            color: AppTheme.mainColorGreen,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
                children: <Widget>[
                  Builder(
                    builder: (BuildContext context) {
                      return DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: SizedBox(
                          height: height! * 0.22,
                          child: Scaffold(
                            backgroundColor: AppTheme.mainColorWhite,
                            appBar: AppBar(
                              toolbarHeight: height! * 0.01,
                              backgroundColor: AppTheme.mainColorWhite,
                              bottom: TabBar(
                                tabs: [
                                  Tab(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Icon(Icons.redeem_outlined,
                                                  color:
                                                      AppTheme.mainColorGrey),
                                            ),
                                            xText(
                                                txt: 'درجة الأعمال',
                                                color: AppTheme.mainColorBlack,
                                                txtSize: width! * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        const Icon(Icons.chair,
                                            color: AppTheme.mainColorGreen),
                                      ],
                                    ),
                                  ),
                                  Tab(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(.0),
                                              child: Icon(
                                                  Icons.payments_outlined,
                                                  color:
                                                      AppTheme.mainColorGrey),
                                            ),
                                            xText(
                                                txt: 'الدرجة الإقتصادية',
                                                color: AppTheme.mainColorBlack,
                                                txtSize: width! * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        const Icon(Icons.chair,
                                            color: AppTheme.mainColorGreen),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            body: TabBarView(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: AppTheme.mainColorNotWhite,
                                  elevation: 5,
                                  child: SizedBox(
                                      height: height! * 0.015,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: xText(
                                                      txt: 'التعريفة',
                                                      color: AppTheme
                                                          .mainColorGreyDark,
                                                      txtSize: width! * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Card(
                                              // color: AppTheme.mainColorGreylight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, right: 16.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    xText(
                                                        txt: 'عرض الأعمال',
                                                        color: AppTheme
                                                            .mainColorGrey,
                                                        txtSize: width! * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    xText(
                                                        txt:
                                                            'SAR ${_listTime.firstWhere((element) => element.name == '${widget.from}-${widget.to}').price.toStringAsFixed(3)}',
                                                        color: AppTheme
                                                            .mainColorGrey,
                                                        txtSize: width! * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    Checkbox(
                                                        visualDensity:
                                                            const VisualDensity(
                                                                horizontal:
                                                                    -2.0,
                                                                vertical: -2.0),
                                                        value: _timeTrainOneWay[
                                                                i]
                                                            .isCheck1,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            _timeTrainOneWay[i]
                                                                    .isCheck1 =
                                                                val!;
                                                            _timeTrainOneWay[i]
                                                                    .isCheck2 =
                                                                false;
                                                          });
                                                        },
                                                        activeColor: AppTheme
                                                            .mainColorBlueAccent,
                                                        checkColor: AppTheme
                                                            .mainColorWhite,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: AppTheme.mainColorNotWhite,
                                  elevation: 5,
                                  child: SizedBox(
                                      height: height! * 0.015,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: xText(
                                                      txt: 'التعريفة',
                                                      color: AppTheme
                                                          .mainColorGreyDark,
                                                      txtSize: width! * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Card(
                                              // color: AppTheme.mainColorGreylight,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  xText(
                                                      txt: 'عرض الإقتصادية',
                                                      color: AppTheme
                                                          .mainColorGrey,
                                                      txtSize: width! * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  xText(
                                                      txt:
                                                          'SAR ${_listTime.firstWhere((element) => element.name == '${widget.from}-${widget.to}').priceWithDisc.toStringAsFixed(3)}',
                                                      color: AppTheme
                                                          .mainColorGrey,
                                                      txtSize: width! * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  Checkbox(
                                                      visualDensity:
                                                          const VisualDensity(
                                                              horizontal: -2.0,
                                                              vertical: -2.0),
                                                      value: _timeTrainOneWay[i]
                                                          .isCheck2,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          _timeTrainOneWay[i]
                                                              .isCheck2 = val!;
                                                          _timeTrainOneWay[i]
                                                              .isCheck1 = false;
                                                        });
                                                      },
                                                      activeColor: AppTheme
                                                          .mainColorBlueAccent,
                                                      checkColor: AppTheme
                                                          .mainColorWhite,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Widget rowTimeTrainRoundTrip() {
    return Column(
      children: [
        for (var i = 3; i < 27; i++)
          Column(
            children: [
              Divider(
                  height: height! * 0.01,
                  color: AppTheme.mainColorGrey,
                  thickness: 1),
              ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    xText(
                        txt:
                            'H ${DateFormat('HH:mm').format(_timeTrainOneWay[i].dateTimeTrain)}',
                        color: AppTheme.mainColorGrey),
                    xText(
                        txt:
                            'H ${DateFormat('HH:mm').format(_timeTrainOneWay[i + 1].dateTimeTrain)}',
                        color: AppTheme.mainColorGrey),
                    Row(
                      children: [
                        xText(
                            txt: DateFormat('HH').format(_listTime
                                .firstWhere((element) =>
                                    element.name ==
                                    '${widget.from}-${widget.to}')
                                .duration),
                            color: AppTheme.mainColorGrey),
                        xText(txt: 'س', color: AppTheme.mainColorGrey),
                        xText(
                            txt: DateFormat('mm').format(_listTime
                                .firstWhere((element) =>
                                    element.name ==
                                    '${widget.from}-${widget.to}')
                                .duration),
                            color: AppTheme.mainColorGrey),
                        xText(txt: 'د ', color: AppTheme.mainColorGrey),
                      ],
                    ),
                    Column(
                      children: [
                        xText(txt: '052$i', color: AppTheme.mainColorGrey),
                        xText(
                            txt: '1 توقف',
                            color: AppTheme.mainColorGreen,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
                children: <Widget>[
                  Builder(
                    builder: (BuildContext context) {
                      return DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: SizedBox(
                          height: height! * 0.22,
                          child: Scaffold(
                            backgroundColor: AppTheme.mainColorWhite,
                            appBar: AppBar(
                              toolbarHeight: height! * 0.01,
                              backgroundColor: AppTheme.mainColorWhite,
                              bottom: TabBar(
                                tabs: [
                                  Tab(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Icon(Icons.redeem_outlined,
                                                  color:
                                                      AppTheme.mainColorGrey),
                                            ),
                                            xText(
                                                txt: 'درجة الأعمال',
                                                color: AppTheme.mainColorBlack,
                                                txtSize: width! * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        const Icon(Icons.chair,
                                            color: AppTheme.mainColorGreen),
                                      ],
                                    ),
                                  ),
                                  Tab(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(.0),
                                              child: Icon(
                                                  Icons.payments_outlined,
                                                  color:
                                                      AppTheme.mainColorGrey),
                                            ),
                                            xText(
                                                txt: 'الدرجة الإقتصادية',
                                                color: AppTheme.mainColorBlack,
                                                txtSize: width! * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        const Icon(Icons.chair,
                                            color: AppTheme.mainColorGreen),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            body: TabBarView(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: AppTheme.mainColorNotWhite,
                                  elevation: 5,
                                  child: SizedBox(
                                      height: height! * 0.015,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: xText(
                                                      txt: 'التعريفة',
                                                      color: AppTheme
                                                          .mainColorGreyDark,
                                                      txtSize: width! * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Card(
                                              // color: AppTheme.mainColorGreylight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, right: 16.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    xText(
                                                        txt: 'عرض الأعمال',
                                                        color: AppTheme
                                                            .mainColorGrey,
                                                        txtSize: width! * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    xText(
                                                        txt:
                                                            'SAR ${_listTime.firstWhere((element) => element.name == '${widget.from}-${widget.to}').price.toStringAsFixed(3)}',
                                                        color: AppTheme
                                                            .mainColorGrey,
                                                        txtSize: width! * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    Checkbox(
                                                        visualDensity:
                                                            const VisualDensity(
                                                                horizontal:
                                                                    -2.0,
                                                                vertical: -2.0),
                                                        value:
                                                            _timeTrainRoundTrip[
                                                                    i]
                                                                .isCheck1,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            _timeTrainRoundTrip[
                                                                        i]
                                                                    .isCheck1 =
                                                                val!;
                                                            _timeTrainRoundTrip[
                                                                        i]
                                                                    .isCheck2 =
                                                                false;
                                                          });
                                                        },
                                                        activeColor: AppTheme
                                                            .mainColorBlueAccent,
                                                        checkColor: AppTheme
                                                            .mainColorWhite,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: AppTheme.mainColorNotWhite,
                                  elevation: 5,
                                  child: SizedBox(
                                      height: height! * 0.015,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: xText(
                                                      txt: 'التعريفة',
                                                      color: AppTheme
                                                          .mainColorGreyDark,
                                                      txtSize: width! * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Card(
                                              // color: AppTheme.mainColorGreylight,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  xText(
                                                      txt: 'عرض الإقتصادية',
                                                      color: AppTheme
                                                          .mainColorGrey,
                                                      txtSize: width! * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  xText(
                                                      txt:
                                                          'SAR ${_listTime.firstWhere((element) => element.name == '${widget.from}-${widget.to}').priceWithDisc.toStringAsFixed(3)}',
                                                      color: AppTheme
                                                          .mainColorGrey,
                                                      txtSize: width! * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  Checkbox(
                                                      visualDensity:
                                                          const VisualDensity(
                                                              horizontal: -2.0,
                                                              vertical: -2.0),
                                                      value:
                                                          _timeTrainRoundTrip[i]
                                                              .isCheck2,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          _timeTrainRoundTrip[i]
                                                              .isCheck2 = val!;
                                                          _timeTrainRoundTrip[i]
                                                              .isCheck1 = false;
                                                        });
                                                      },
                                                      activeColor: AppTheme
                                                          .mainColorBlueAccent,
                                                      checkColor: AppTheme
                                                          .mainColorWhite,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
