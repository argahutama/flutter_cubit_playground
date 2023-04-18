# Cat Facts

A Flutter app that displays random cat facts using the [Cat Fact API](https://catfact.ninja/#/Facts).

## Author

- Arga Hutama (argahut@gmail.com)

## How to Set Up

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

## Features

- Displays a random cat fact.
- Allows the user to refresh the cat fact.
- Handles errors gracefully if the API is unavailable or returns an error response.
- Supports multiple flavors for different environments.

## Dependencies

- [http](https://pub.dev/packages/http): A library for making HTTP requests.
- [get_it](https://pub.dev/packages/get_it): A simple yet powerful dependency injection framework for Dart and Flutter.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): A library for implementing the BLoC architecture in Flutter apps.

## Architecture

This app follows the BLoC (Business Logic Component) architecture, which separates the presentation layer from the business logic and data access layers. The app consists of the following components:

- UI components: The user interface of the app, including widgets for displaying the cat fact and handling user input.
- Bloc components: The business logic of the app, which contains the state and methods for fetching and refreshing the cat fact.
- Repository components: The data access layer of the app, which handles API requests and responses.
- Service components: The infrastructure layer of the app, which provides utility methods and abstractions for interacting with external systems.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.