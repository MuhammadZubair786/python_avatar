import 'package:flutter/material.dart';

class DisAllowIndicatorWidget extends StatelessWidget {
  final Widget child;

  const DisAllowIndicatorWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
