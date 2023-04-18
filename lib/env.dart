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
          baseUrl = "dev base url";
          title = "Flutter flavors dev";
          break;
        }
      case Env.stg:
        {
          baseUrl = "stg base url";
          title = "Flutter flavors stg";
          break;
        }
      case Env.prod:
        {
          baseUrl = "prod base url";
          title = "Flutter flavors";
          break;
        }
    }
  }
}
