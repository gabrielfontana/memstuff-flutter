import '../helpers/parse_helper.dart';

import '../models/floor_model.dart';
import '../models/result_model.dart';
import '../models/room_model.dart';

class CalculatorController {
  final RoomModel _room = RoomModel();
  final FloorModel _floor = FloorModel();

  void setRoomWitdh(String value) {
    _room.width = ParseHelper.toDouble(value);
  }

  void setRoomLength(String value) {
    _room.length = ParseHelper.toDouble(value);
  }

  void setFloorWitdh(String value) {
    _floor.width = ParseHelper.toDouble(value);
  }

  void setFloorLength(String value) {
    _floor.length = ParseHelper.toDouble(value);
  }

  void setFloorPrice(String value) {
    _floor.price = ParseHelper.toDouble(value);
  }

  ResultModel calculate() {
    return ResultModel(
      piecesByWidth: (_room.width / _floor.width).ceil(),
      piecesByLength: (_room.length / _floor.length).ceil(),
      areaFloor: _floor.width * _floor.length,
      squareMeterPrice: _floor.price,
    );
  }
}
