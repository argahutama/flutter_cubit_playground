import 'package:common/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:playground/injection.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void getDependencies() {
  getIt.init();
}
