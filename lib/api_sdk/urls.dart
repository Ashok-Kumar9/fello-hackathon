enum Mode { dev, prod }

const Mode appMode = Mode.dev;

String getBaseUrl() {
  switch (appMode) {
    case Mode.dev:
      return 'https://dummyjson.com/products/';
    case Mode.prod:
      return 'https://fello.in';
  }
}

enum EndPoints {
  products,
  ;

  static String getEndpoint(EndPoints endpoint) {
    switch (endpoint) {
      case EndPoints.products:
        return '/products/';
    }
  }
}
