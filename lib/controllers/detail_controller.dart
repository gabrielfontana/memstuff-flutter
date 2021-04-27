import '../repositories/stuff_repository.dart';
import '../models/stuff_model.dart';

class DetailController {
  final StuffRepository _repository;

  DetailController(this._repository);

  int id;
  String photo = '';
  String description = '';
  String name = '';
  String date = '';

  setId(int value) => id = value;
  setPhoto(String value) => photo = value;
  setDescription(String value) => description = value;
  setName(String value) => name = value;
  setDate(String value) => date = value;

  Future save() async {
    final stuff = StuffModel(
      id: id,
      photoPath: photo,
      description: description,
      contactName: name,
      date: date,
    );

    if (id == null) {
      await _repository.create(stuff);
    } else {
      await _repository.update(stuff);
    }
  }
}
