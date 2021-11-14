
import 'package:flutter/material.dart';
import 'package:link_dev_task/core/consts/colors.dart';

class ErrorText extends StatelessWidget {
  final String errorMsg;
  const ErrorText({Key key, @required this.errorMsg}) : assert(errorMsg != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.errorMsg,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.errorTextColor,
        fontSize: 24,
      ),
    );
  }
}
