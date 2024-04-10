import 'package:schedule_for_ictis_flutter/main.dart';

import '../../objectbox.g.dart';
import '../models/couple_db.dart';

class CouplesRepository {
  late Box<CoupleDB> _couplesBox;

  CouplesRepository() {
    _couplesBox = objectBox.store.box<CoupleDB>();
  }

  Future<CoupleDB?> getCoupleByID(String id) {
    return _couplesBox
        .query(CoupleDB_.idForSearch.equals(id))
        .build()
        .findFirstAsync();
  }
}