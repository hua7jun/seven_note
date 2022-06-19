import 'package:flutter/material.dart';

const double _kTabWidth = 100;
const double _kTabHeight = 46.0;

class CustomTab extends Tab {
  const CustomTab({
    Key? key,
    required this.child,
  }) : super(key: key, child: child);

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final double calculatedHeight;
    final Widget label;
    calculatedHeight = _kTabHeight;
    label = child;
    return SizedBox(
      width: _kTabWidth,
      height: height ?? calculatedHeight,
      child: Center(
        widthFactor: 1.0,
        child: label,
      ),
    );
  }
}
