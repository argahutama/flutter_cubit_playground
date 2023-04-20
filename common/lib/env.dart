enum Env { dev, stg, prod }

abstract class AppEnv {
  static late String baseUrl;
  static late String title;
  static late Env _env;

  static Env get env => _env;

  static setupEnv(Env env) {
    _env = env;
    switch (env) {
      case Env.dev:
        {
          baseUrl = 'https://catfact.ninja';
          title = 'Flutter flavors dev';
          break;
        }
      case Env.stg:
        {
          baseUrl = 'https://catfact.ninja';
          title = 'Flutter flavors stg';
          break;
        }
      case Env.prod:
        {
          baseUrl = 'https://catfact.ninja';
          title = 'Flutter flavors';
          break;
        }
    }
  }
}
