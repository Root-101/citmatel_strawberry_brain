import 'dart:math';

import 'package:citmatel_strawberry_brain/src/app/brain_app_exporter.dart';
import 'package:clean_core/clean_core.dart';

class BrainHintUseCaseImpl extends DefaultReadUseCase<BrainHintDomain>
    implements BrainHintUseCase {
  BrainHintUseCaseImpl(List<BrainHintDomain> info) : super(info);

  @override
  BrainHintDomain nextHint() {
    return findAll()[Random().nextInt(
      count(),
    )];
  }
}
