import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models/cat/cat_info.dart';
import 'package:ui/blocs/cat_details_bloc.dart';
import 'package:ui/pages/base_state.dart';
import 'package:ui/util/extensions/context_extensions.dart';

class CatDetailsArguments {
  CatInfo? catInfo;

  CatDetailsArguments({required this.catInfo});
}

class CatDetailsPage extends StatefulWidget {
  final CatDetailsArguments arguments;
  const CatDetailsPage({super.key, required this.arguments});

  static const String route = 'details';

  @override
  State<CatDetailsPage> createState() => _CatDetailsPageState();

  static Widget buildPage(BuildContext context, Object? args) {
    final arguments = args as CatDetailsArguments?;

    assert(arguments != null, '$CatDetailsArguments can not be null');

    return CatDetailsPage(arguments: arguments!);
  }
}

class _CatDetailsPageState extends BaseState<CatDetailsPage, CatDetailsBloc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                widget.arguments.catInfo!.url!,
                fit: BoxFit.fill,
                height: context.mediaQuerySize.height / 1.8,
              ),
            ),
            buttonArrow(),
            scroll()
          ],
        ),
      ),
    );
  }

  buttonArrow() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          context.pop();
        },
        child: Container(
          height: 55,
          width: 55,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.8,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                      widget.arguments.catInfo?.breeds?.firstOrNull?.name ?? '',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Temperament",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    widget.arguments.catInfo?.breeds?.firstOrNull
                            ?.temperament ??
                        '',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Origin",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    widget.arguments.catInfo?.breeds?.firstOrNull?.origin ?? '',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      widget.arguments.catInfo?.breeds?.firstOrNull
                              ?.description ??
                          '',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
