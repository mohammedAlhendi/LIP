import 'package:flutter/material.dart';
import 'package:train/system/seat_layout_state_model.dart';
import 'package:train/system/seat_model.dart';
import 'package:train/system/seat_state.dart';
import 'package:train/ui/seat_widget.dart';

class SeatLayoutWidget extends StatelessWidget {
  final SeatLayoutStateModel stateModel;
  final void Function(int rowI, int colI, SeatState currentState)
      onSeatStateChanged;

  const SeatLayoutWidget({
    Key? key,
    required this.stateModel,
    required this.onSeatStateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return InteractiveViewer(
      maxScale: 5,
      minScale: 0.8,
      constrained: true,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List<int>.generate(stateModel.rows, (rowI) => rowI)
                .map<Row>(
                  (rowI) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List<int>.generate(stateModel.cols, (colI) => colI)
                          .map<SeatWidget>((colI) => SeatWidget(
                                model: SeatModel(
                                  num: count++,
                                  seatState: stateModel.currentSeatsState[rowI]
                                      [colI],
                                  rowI: rowI,
                                  colI: colI,
                                  seatSvgSize: stateModel.seatSvgSize,
                                  pathSelectedSeat: stateModel.pathSelectedSeat,
                                  pathDisabledSeat: stateModel.pathDisabledSeat,
                                  pathSoldSeat: stateModel.pathSoldSeat,
                                  pathUnSelectedSeat:
                                      stateModel.pathUnSelectedSeat,
                                ),
                                onSeatStateChanged: onSeatStateChanged,
                              ))
                          .toList()
                    ],
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
