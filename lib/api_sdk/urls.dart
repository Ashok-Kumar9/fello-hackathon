enum Mode { dev, prod }

const Mode appMode = Mode.dev;

String getBaseUrl() {
  switch (appMode) {
    case Mode.dev:
      return 'https://fello.in';
    case Mode.prod:
      return 'https://fello.in';
  }
}

enum EndPoints {
  login,
  ;

  static String getEndpoint(EndPoints endpoint) {
    switch (endpoint) {
      case EndPoints.login:
        return '/login/';
    }
  }
}
