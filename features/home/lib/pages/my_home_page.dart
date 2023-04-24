import 'package:common/extension/string_ext.dart';
import 'package:common/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../cubit/cat_facts_cubit.dart';
import '../widgets/cat_fact_list_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pagingController = PagingController<int, String>(firstPageKey: 0);

  @override
  void initState() {
    context.read<CatFactsCubit>().getCatFacts();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<CatFactsCubit>().getCatFacts();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocConsumer<CatFactsCubit, CatFactsState>(
          listener: (context, state) {
            state.maybeMap(
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.error.toString().shortenDioErrorMessage()),
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) => state.maybeMap(
            orElse: () => Center(child: Container()),
            loading: (e) => const Center(child: CircularProgressIndicator()),
            success: (e) {
              final newItems = e.catFacts.data;
              final isLastPage = e.catFacts.nextPageUrl == null;
              if (isLastPage) {
                _pagingController.appendLastPage(newItems);
              } else {
                final nextPageKey =
                    getIt<CatFactsCubit>().currentPage + newItems.length;
                _pagingController.appendPage(newItems, nextPageKey);
              }
              return PagedListView<int, String>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<String>(
                  itemBuilder: (context, item, index) => CatFactListItem(item),
                ),
              );
            },
          ),
        ),
      );
}
