import 'package:flutter/material.dart';
import 'package:train/system/app_theme.dart';
import 'package:train/system/constants.dart';

class NumberStepper extends StatefulWidget {
  final int initialValue;
  final int min;
  final int max;
  final int step;

  final Function(int) onChanged;

  const NumberStepper(
      {super.key,
      required this.initialValue,
      required this.min,
      required this.max,
      required this.step,
      required this.onChanged});

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int _currentValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height! * 0.035,
      decoration: BoxDecoration(
          color: AppTheme.mainColorWhite,
          border: Border.all(width: 1, color: AppTheme.mainChipBackground),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
            width: width! * 0.09,
            decoration: const BoxDecoration(
                color: AppTheme.mainColorGreen,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: width! * 0.1,
                onPressed: () {
                  setState(() {
                    if (_currentValue < widget.max) {
                      _currentValue += widget.step;
                    }
                    widget.onChanged(_currentValue);
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: AppTheme.mainColorWhite,
                  size: width! * 0.05,
                )),
          ),
          SizedBox(
            width: width! * 0.08,
            child: xText(
                txt: _currentValue,
                color: AppTheme.mainColorGreyDark,
                txtSize: width! * 0.04,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center),
          ),
          Container(
            width: width! * 0.09,
            decoration: const BoxDecoration(
                color: AppTheme.mainColorGreyDark,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: width! * 0.1,
                onPressed: () {
                  setState(() {
                    if (_currentValue > widget.min) {
                      _currentValue -= widget.step;
                    }
                    widget.onChanged(_currentValue);
                  });
                },
                icon: Icon(
                  Icons.remove,
                  color: AppTheme.mainColorWhite,
                  size: width! * 0.05,
                )),
          ),
        ],
      ),
    );
  }
}
