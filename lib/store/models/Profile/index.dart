import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';

@immutable
class Profile {
  const Profile({this.poscompStatus});

  factory Profile.init() => const Profile(poscompStatus: PoscompStatus());

  final PoscompStatus poscompStatus;
}
