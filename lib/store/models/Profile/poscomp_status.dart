import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
class PoscompStatus {
  final int exam;
  final List<String> answers;

  PoscompStatus({this.exam, this.answers});
}
