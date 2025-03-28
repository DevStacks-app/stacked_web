# stacked_web

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A stacked web package for DevStacks.

## Scope of the package

This package will at the very least support the following:

- [x] Works on Windows 10 & 11 and iOS
- [x] Multiple web views that can be laid over each other
- [ ] Communicate between Dart and the web view's JS runtime
- [ ] Set the JS mode (strict vs disabled)
- [ ] Have access to the navigation changes (on page change, on page progress, on page start, on page finish)
- [ ] Gesture recognition

## Setup Requirements

### Windows

To be able to build on Windows, you must have the nuget CLI tool available on your Windows environment.

> See https://inappwebview.dev/docs/intro/#setup-windows for more information

### iOS

No setup required but I recommend reading the `flutter_inappwebview` docs in case you are facing problems: https://inappwebview.dev/docs/intro/#setup-ios

### macOS

To be able to make HTTP requests, you need to configure the macOS App Sandbox by enabling the `Outgoing Connections (Client)` option in your MacOS XCode Project, under `Runner > Signing & Capabilities`.

> See https://inappwebview.dev/docs/intro/#setup-macos for more information

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
