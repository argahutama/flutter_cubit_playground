import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/domain/get_cat_facts_use_case.dart';
import 'package:playground/domain/model/cat_facts.dart';
import 'package:playground/injection.dart';

part 'cat_facts_cubit.freezed.dart';
part 'cat_facts_state.dart';

@injectable
class CatFactsCubit extends Cubit<CatFactsState> {
  CatFactsCubit() : super(const CatFactsState.initial()) {
    getCatFacts(1);
  }

  void getCatFacts(int page) async {
    emit(const CatFactsState.loading());
    try {
      emit(
        CatFactsState.success(
          await getIt<GetCatFactsUseCase>().invoke(page),
        ),
      );
    } catch (e) {
      emit(CatFactsState.error(e as DioError));
    }
  }
}
