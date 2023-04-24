import 'dart:io';

import 'package:common/extension/string_ext.dart';
import 'package:common/injection.dart';
import 'package:common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  DateTime? _lastPressedAt;
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
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: BlocConsumer<CatFactsCubit, CatFactsState>(
            listener: (context, state) {
              state.maybeMap(
                loading: (e) {},
                error: (e) {
                  _refreshController.refreshFailed();
                  Utils.showSnackBar(
                    context,
                    e.error.toString().shortenDioErrorMessage(),
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
        ),
      );

  void _onRefresh() {
    _pagingController.itemList = [];
    context.read<CatFactsCubit>().refreshGetCatFacts();
  }

  Future<bool> _onWillPop() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final now = DateTime.now();
      if (_lastPressedAt == null ||
          now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
        _lastPressedAt = now;
        Utils.showSnackBar(context, 'Press back again to exit');
        return false;
      } else {
        return pop();
      }
    } else {
      return pop();
    }
  }

  Future<bool> pop() async {
    await SystemNavigator.pop();
    return true;
  }
}
