import 'package:clean_core/clean_core.dart';

class BrainHintDomain extends BasicDomainObject {
  int id;
  late final String hint;

  BrainHintDomain({
    required this.id,
    required this.hint,
  });

  BrainHintDomain.list({
    required this.id,
    required List<String> hintParts,
  }) {
    this.hint = hintParts.reduce((value, element) => "$value\n$element");
  }
}
