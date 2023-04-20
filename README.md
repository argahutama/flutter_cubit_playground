# Cat Facts

A Flutter app that displays random cat facts using the [Cat Facts API](https://catfact.ninja/#/Facts).

## Author

- Arga Hutama (argahut@gmail.com)


## Features

- Display random cat facts
- Infinite scroll pagination
- Modularized
- Clean Architecture


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


## How to run
To run the app in dev mode, execute the following command:

```
make all-dev
```

To run the app in staging mode, execute the following command:
```
make all-stg
```

To run the app in production mode, execute the following command:
```
make all-prod
```

By default, the app runs in debug mode. If you want to run the app in release mode, add FLAGS="--release" after the command.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.