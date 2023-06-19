import 'package:flutter/material.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';
import 'package:train/system/methods.dart';
import 'package:train/system/seat_layout_state_model.dart';
import 'package:train/system/seat_state.dart';
import 'package:train/system/train_persons.dart';
import 'package:train/ui/person_info_screen.dart';
import 'package:train/ui/seat_layout_widget.dart';

// ignore: must_be_immutable
class ChairTrainScreen extends StatefulWidget {
  ChairTrainScreen(this.persons, {Key? key}) : super(key: key);
  TrainPersons persons;

  @override
  State<ChairTrainScreen> createState() => _ChairTrainScreenState();
}

class _ChairTrainScreenState extends State<ChairTrainScreen> {
  Set<SeatNumber> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              Image.asset('assets/images/train_chair.png'),
              Container(
                height: height! * 0.6,
                width: width! * 0.41,
                color: AppTheme.mainColorGreenLight,
                child: SeatLayoutWidget(
                  onSeatStateChanged: (rowI, colI, seatState) {
                    if (seatState == SeatState.selected) {
                      selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                    } else {
                      selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                    }
                  },
                  stateModel: const SeatLayoutStateModel(
                    rows: 9,
                    cols: 4,
                    seatSvgSize: 40,
                    pathSelectedSeat: 'assets/images/chair_selected.svg',
                    pathDisabledSeat: 'assets/images/chair_disabled.svg',
                    pathSoldSeat: 'assets/images/chair_sold.svg',
                    pathUnSelectedSeat: 'assets/images/chair_unselected.svg',
                    currentSeatsState: [
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                      [
                        SeatState.unselected,
                        SeatState.empty,
                        SeatState.unselected,
                        SeatState.unselected,
                      ],
                    ],
                  ),
                ),
              ),
              Image.asset('assets/images/train_chair_2.png'),
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
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: SizedBox(
                  height: height! * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: AppTheme.mainColorGreen,
                      child: InkWell(
                        onTap: () {
                          if (widget.persons.countPerson ==
                              selectedSeats.length) {
                            pushScreen(context,
                                PersonInfoScreen(widget.persons), 'push');
                            xShowGeneralDialog(
                                context, const Duration(seconds: 2));
                          } else {
                            xSnackBar(
                                context, 'الرجاء حجز المقاعد حسب عدد الركاب');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: xText(
                              txt: 'الدفع',
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
            ],
          )),
        ));
  }
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
