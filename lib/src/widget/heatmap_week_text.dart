import 'package:flutter/material.dart';
import '../util/date_util.dart';

class HeatMapWeekText extends StatelessWidget {
  /// The margin value for correctly space between labels.
  final EdgeInsets? margin;

  /// The double value of label's font size.
  final double? fontSize;

  /// The double value of every block's size to fit the height.
  final double? size;

  /// The color value of every font's color.
  final Color? fontColor;

  // custom week labels
  // for localization purpose
  // 1. if weekdayLabels is null, then use default labels(en)
  final List<String>? weekdayLabels;
  const HeatMapWeekText({
    Key? key,
    this.margin,
    this.weekdayLabels,
    this.fontSize,
    this.size,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> finalWeekLabels = [];
    if (weekdayLabels == null) {
      finalWeekLabels = DateUtil.WEEK_LABEL;
    } else {
      finalWeekLabels = weekdayLabels!;
      finalWeekLabels.insert(0, "");
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (String label in finalWeekLabels)
          Container(
            height: size ?? 20,
            margin: margin ?? const EdgeInsets.all(2.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize ?? 12,
                color: fontColor,
              ),
            ),
          ),
      ],
    );
  }
}
