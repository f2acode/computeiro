import 'package:meta/meta.dart';

@immutable
class Poscomp {
  final int balance;

  Poscomp({this.balance});

  Poscomp copyWith({int balance}) {
    return Poscomp(
      balance: balance ?? this.balance,
    );
  }

  @override
  int get hashCode => balance.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Poscomp &&
          runtimeType == other.runtimeType &&
          balance == other.balance;

  @override
  String toString() {
    return 'Poscomp{balance: $balance}';
  }
}
