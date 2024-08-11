import 'package:flutter/material.dart';
import 'package:ui/resources/values.dart';

class LoadingButton extends StatelessWidget {
  final Stream<bool> stream;
  final Color? color;
  final bool initialData;
  final Widget Function() builder;
  const LoadingButton(
      {super.key,
      required this.stream,
      required this.builder,
      this.color,
      this.initialData = false});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        initialData: initialData,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const SizedBox(
                width: Values.progressButtonSize,
                height: Values.progressButtonSize,
                child: CircularProgressIndicator());
          }
          return builder();
        });
  }
}
