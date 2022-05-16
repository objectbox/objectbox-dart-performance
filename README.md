# ObjectBox Flutter Database Performance Benchmarks

## Building

Generate code with `flutter pub run build_runner build`.

## Running

To run in release mode with Android Studio connect a device or start an emulator, then
Run > Flutter Run 'main.dart' in Release Mode

This will edit the `main.dart` run configuration and add `--release`to "Additional run args".

To improve performance, make sure to disconnect dev tools. E.g. stop the app and launch it again.

## Implementation notes

### Isar

- Instead of read all does use query with no conditions and returns all results.
- Query tests not available (queryWithLinks not implemented).
