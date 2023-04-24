import 'package:common/extension/string_ext.dart';
import 'package:common/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/cat_facts_cubit.dart';
import '../widgets/cat_fact_list_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _refreshController = RefreshController(initialRefresh: true);
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
              loading: (e) {},
              error: (e) {
                _refreshController.refreshFailed();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.error.toString().shortenDioErrorMessage()),
                  ),
                );
              },
              orElse: () {
                _refreshController.refreshCompleted();
              },
            );
          },
          builder: (context, state) => SmartRefresher(
            controller: _refreshController,
            header: const WaterDropMaterialHeader(),
            onRefresh: _onRefresh,
            child: state.maybeMap(
              orElse: () => Center(child: Container()),
              loading: (e) => const SizedBox(),
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
                    itemBuilder: (context, item, index) =>
                        CatFactListItem(item),
                  ),
                );
              },
            ),
          ),
        ),
      );

  void _onRefresh() {
    _pagingController.itemList = [];
    context.read<CatFactsCubit>().refreshGetCatFacts();
  }
}
