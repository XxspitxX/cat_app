import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:models/cat/cat_info.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui/blocs/home_bloc.dart';
import 'package:ui/pages/cat_details_page.dart';

class ListCatsBreeds extends StatefulWidget {
  final HomeBloc bloc;
  const ListCatsBreeds({super.key, required this.bloc});

  @override
  State<ListCatsBreeds> createState() => _ListCatsBreedsState();
}

class _ListCatsBreedsState extends State<ListCatsBreeds> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchableList<CatInfo?>.async(
      asyncListCallback: () async {
        return await widget.bloc.getBreeds();
      },
      onRefresh: () async {
        await widget.bloc.getBreeds();
      },
      keyboardAction: TextInputAction.search,
      inputDecoration: InputDecoration(
        labelText: "Search Breed",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      asyncListFilter: (q, list) {
        return list
            .where((element) =>
                element?.breeds?.firstOrNull?.name?.toLowerCase().contains(q) ??
                false)
            .toList();
      },
      itemBuilder: (item) {
        return FutureBuilder<CatInfo?>(
          future: widget.bloc.getCatInfo(item?.id),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return GestureDetector(
                onTap: () {
                  _goToDetail(snapshot.data);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          snapshot.data!.url!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          snapshot.data?.breeds?.firstOrNull?.name ?? '',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const _CardLoadingListItem();
          },
        );
      },
    );
  }

  void _goToDetail(CatInfo? catInfo) {
    context.pushNamed(
      CatDetailsPage.route,
      extra: CatDetailsArguments(catInfo: catInfo),
    );
  }
}

class _CardLoadingListItem extends StatelessWidget {
  const _CardLoadingListItem();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black87,
      highlightColor: Colors.red,
      child: const SizedBox(
        width: double.infinity,
        height: 250,
      ),
    );
  }
}
