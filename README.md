# ObjectBox Flutter Database Performance Benchmarks

## Setup

As usual run `flutter pub get`.

## Running

Make sure to run the app in release mode to avoid any performance penalties from debug mode.

To run in release mode with Android Studio connect a device or start an emulator, then
Run > Flutter Run 'main.dart' in Release Mode.

Or run `flutter run --release`.

To further improve performance, make sure to disconnect dev tools. E.g. stop the app on the device
and launch it again.

## Implementation notes

### Hive

- No test with index as Hive does not support explicit indexes.

### Isar

- Instead of read all does use query with no conditions and returns all results.
- Query tests not available (queryWithLinks not implemented).
