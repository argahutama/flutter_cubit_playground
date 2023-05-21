import 'package:domain/model/cat_facts.dart';
import 'package:domain/usecase/get_cat_facts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_facts_cubit.freezed.dart';
part 'cat_facts_state.dart';

class CatFactsCubit extends Cubit<CatFactsState> {
  final GetCatFactsUseCase getCatFactsUseCase;

  CatFactsCubit(this.getCatFactsUseCase) : super(const CatFactsState.initial());

  var currentPage = 1;

  void getCatFacts() async {
    if (currentPage == 1) emit(const CatFactsState.loading());
    try {
      emit(
        CatFactsState.success(
          await getCatFactsUseCase.invoke(currentPage++),
        ),
      );
    } catch (e) {
      emit(CatFactsState.error(e as Exception));
    }
  }

  void refreshGetCatFacts() async {
    currentPage = 1;
    emit(const CatFactsState.loading());
    getCatFacts();
  }
}
