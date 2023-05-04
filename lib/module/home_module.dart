import 'package:home/cubit/cat_facts_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HomeModule {
  @injectable
  CatFactsCubit get catFactsCubit;
}
