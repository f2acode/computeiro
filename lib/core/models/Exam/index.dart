import 'package:computeiro/core/models/Exam/question.dart';
import 'package:computeiro/core/models/Exam/asset.dart';

class Exam {
  const Exam({
    this.questions,
    this.year,
    this.assets,
    this.title,
  });

  final List<Asset> assets;
  final List<Question> questions;
  final int year;
  final String title;
}
