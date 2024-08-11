import 'package:flutter/widgets.dart';
import 'package:ui/resources/assets.dart';
import 'package:ui/resources/values.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: Values.sizeSplash,
          height: Values.sizeSplash,
          child: Column(
            children: [Image.asset(Assets.empty), Text('SIN DATOS')],
          )),
    );
  }
}
