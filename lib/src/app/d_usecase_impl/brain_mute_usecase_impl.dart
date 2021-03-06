import 'package:citmatel_strawberry_brain/brain_exporter.dart';
import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';

class BrainMuteUseCaseImpl extends SingleKeyValueUseCaseImpl<String, bool>
    implements BrainMuteUseCase {
  static const String KEY = "MUTE_KEY";
  static const bool DEFAULT_VALUE = false;

  BrainMuteUseCaseImpl()
      : super(
          key: KEY,
          defaultValue: DEFAULT_VALUE,
          repo: KeyValueRepoModule.buildKeyValueRepo(
            converter: MuteKeyValueConverter.converter,
            key: KEY,
          ),
        );

  @override
  bool changeValue() {
    return update(!read());
  }
}

class MuteKeyValueConverter implements SingleKeyValueConverter<String, bool> {
  static final MuteKeyValueConverter converter = MuteKeyValueConverter._();

  MuteKeyValueConverter._();

  @override
  String keyToString(String key) {
    return key;
  }

  @override
  bool stringToValue(String value) {
    return value.toLowerCase() == 'true' ? true : false;
  }

  @override
  String valueToString(bool value) {
    return value ? 'true' : 'false';
  }
}
