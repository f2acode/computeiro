import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';

@immutable
class Profile {
  final PoscompStatus poscompStatus;

  Profile({this.poscompStatus});

  factory Profile.init() => new Profile();
}
