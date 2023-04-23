import 'package:common/injection.dart';
import 'package:domain/model/cat_facts.dart';
import 'package:domain/usecase/get_cat_facts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_facts_cubit.freezed.dart';
part 'cat_facts_state.dart';

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
