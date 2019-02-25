import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/core/models/Profile/poscomp_status.dart';

class Profile extends Model {
  Profile({this.poscompStatus});

  factory Profile.init() => Profile(poscompStatus: PoscompStatus());

  PoscompStatus poscompStatus;
}
