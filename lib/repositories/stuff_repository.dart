import '../models/stuff_model.dart';

abstract class StuffRepository {
  Future<StuffModel> create(StuffModel stuff);
  Future<List<StuffModel>> readAll();
  Future<StuffModel> readById(int id);
  Future<bool> update(StuffModel stuff);
  Future<bool> delete(StuffModel stuff);
}
