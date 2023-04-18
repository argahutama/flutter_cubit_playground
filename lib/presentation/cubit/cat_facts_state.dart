part of 'cat_facts_cubit.dart';

@freezed
class CatFactsState with _$CatFactsState {
  const factory CatFactsState.initial() = _Initial;
  const factory CatFactsState.loading() = _Loading;
  const factory CatFactsState.success(CatFacts catFacts) = _Success;
  const factory CatFactsState.error(Exception error) = _Error;
}
