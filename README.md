# ObjectBox Benchmarks for Flutter

## Building

Generate code with `flutter pub run build_runner build`.

**TODO remove later; isar v0.4.0 needs a "public zero-arg constructor"**
After generating code need to manually adjust `isar.g.dart` and replace constructor calls
with `Example.forIsar()` calls.

## Running

To run in release mode with Android Studio connect a device or start an emulator, then
Run > Flutter Run 'main.dart' in Release Mode

This will edit the `main.dart` run configuration and add `--release`to "Additional run args".
