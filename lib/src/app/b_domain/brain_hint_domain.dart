import 'package:clean_core/clean_core.dart';

class BrainHintDomain extends BasicDomainObject {
  int id;
  final String hint;

  BrainHintDomain({
    required this.id,
    required this.hint,
  });
}
