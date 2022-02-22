import 'package:citmatel_strawberry_brain/src/app/b_domain/brain_domain_exporter.dart';

class BrainHints {
  static final hints = [
    BrainHintDomain(id: 1, hint: "hihihi"),
    BrainHintDomain(id: 2, hint: "123\n456\n789"),
    BrainHintDomain(id: 3, hint: "hello world!!!"),
    BrainHintDomain(id: 4, hint: "Show me\nthe\nmoneeeeeeeeeeeey"),
    BrainHintDomain.list(id: 5, hintParts: ["hola", "mundo", "cruel"]),
  ];
}
