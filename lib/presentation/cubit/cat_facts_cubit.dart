import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/domain/get_cat_facts_use_case.dart';
import 'package:playground/domain/model/cat_facts.dart';
import 'package:playground/injection.dart';

part 'cat_facts_cubit.freezed.dart';
part 'cat_facts_state.dart';

@lazySingleton
class CatFactsCubit extends Cubit<CatFactsState> {
  var currentPage = 1;

  CatFactsCubit() : super(const CatFactsState.initial());

  void getCatFacts() async {
    if (currentPage == 1) emit(const CatFactsState.loading());
    try {
      emit(
        CatFactsState.success(
          await getIt<GetCatFactsUseCase>().invoke(currentPage++),
        ),
      );
    } catch (e) {
      emit(CatFactsState.error(e as Exception));
    }
  }
}
