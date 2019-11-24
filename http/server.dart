library http;

import 'dart:io';

void processRequest(HttpRequest request) {
  print('${request.method} ${request.uri.path}');
  final response = request.response;

  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = ContentType('text', 'plain')
      ..write('Hello from the dart server');
  } else {
    response
      ..statusCode = HttpStatus.notFound
      ..headers.contentType = ContentType('text', 'plain')
      ..write('not found');
  }

  response.close();
}

Future main() async {
  final requests = await HttpServer.bind('localhost', 8888);

  await for (var request in requests) processRequest(request);
}
