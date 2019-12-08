# Dart

[Dart](https://dart.dev/) is a client-optimized language for fast apps on any platform.

[Dart github](https://github.com/dart-lang)

[Dart packages](https://pub.dev/)

Install Dart on Windows

```bash
# install
choco install dart-sdk

# update to last
choco upgrade dart-sdk

# see version
dart --version
```

Using Dart CLI

```bash
# simple run
dart main.dart

# AOT (ahead-of-time) compile a Dart program to native x64 machine code
dart2aot main.dart main.dart.aot

# run comiled native code
dartaotruntime main.dart.aot
```

Install globaly CLI tool [Stagehand](https://pub.dev/packages/stagehand) - A Dart project generator

```bash
# pub global activate <package_name> - global install
pub global activate stagehand
```

Install dependencies for current project

```bash
# install dependencies
pub get
```

## Back-end

[Aqueduct](https://aqueduct.io/) is an extensible HTTP framework for building REST APIs on top of the Dart VM. It includes a statically-typed ORM, OAuth 2.0 provider,
automated testing libraries and OpenAPI 3.0 integration.

## Mobile / Web UI / Desktop

[Flutter](https://flutter.dev/) is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
