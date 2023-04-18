# Cat Facts

A Flutter app that displays random cat facts using the [Cat Facts API](https://catfact.ninja/#/Facts).


## Features

- Display random cat facts
- Infinite scroll pagination
- Modularized and Clean Architecture


## Dependencies

- [dio](https://pub.dev/packages/dio): A powerful Http client for Dart
- [build_runner](https://pub.dev/packages/build_runner): A tool for generating files using Dart code
- [injectable](https://pub.dev/packages/injectable): A lightweight dependency injection library for Dart and Flutter
- [get_it](https://pub.dev/packages/get_it): A simple Service Locator for Dart and Flutter projects
- [freezed](https://pub.dev/packages/freezed): A code generator for unions/pattern-matching/copy
- [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination): A Flutter package for infinite scroll pagination


## Architecture

- Presentation Layer: The UI components of the app, including widgets for displaying the cat fact and handling user input.
- Domain Layer: The layer that defines the business logic of the app, including the entities and use cases. It is independent of any specific implementation details.
- Data Layer: The layer that handles data access, including retrieving and storing data from external sources. It communicates with the domain layer through interfaces, which ensures


## Getting Started

1. Install dependencies by running the following command:

```
flutter pub get
```

2. Generate code for dependency injection by running the following command:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

3. Run the app by running one of the following commands, depending on the flavor you want to run:

- Dev:

```
flutter run --target lib/main_dev.dart --flavor dev
```

- Staging:

```
flutter run --target lib/main_stg.dart --flavor stg
```

- Production:

```
flutter run --target lib/main_prod.dart --flavor prod
```


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.