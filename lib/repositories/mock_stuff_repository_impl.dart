import '../models/stuff_model.dart';
import 'stuff_repository.dart';

class MockStuffRepositoryImpl implements StuffRepository {
  @override
  Future<StuffModel> create(StuffModel stuff) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value(null);
  }

  @override
  Future<bool> delete(StuffModel stuff) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value(false);
  }

  @override
  Future<List<StuffModel>> readAll() async {
    await Future.delayed(Duration(seconds: 4));
    final list = <StuffModel>[];
    list.add(
      StuffModel(
        id: 1,
        description: 'Livro de Flutter',
        contactName: 'Gabriel Fontana',
        date: '05/04/2021',
      ),
    );
    list.add(
      StuffModel(
        id: 2,
        description: 'Mouse',
        contactName: 'Abner Silva',
        date: '10/03/2021',
      ),
    );
    list.add(
      StuffModel(
        id: 3,
        description: 'Caderno',
        contactName: 'João da Silva',
        date: '01/04/2021',
      ),
    );
    return list;
  }

  @override
  Future<StuffModel> readById(int id) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value(null);
  }

  @override
  Future<bool> update(StuffModel stuff) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value(false);
  }
}
