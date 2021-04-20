import 'package:flutter/material.dart';
import '../models/stuff_model.dart';
import 'detail_page.dart';
import '../widgets/stuff_card.dart';
import '../widgets/stuff_listview.dart';
import '../repositories/mock_stuff_repository_impl.dart';
import '../controllers/home_controller.dart';
import '../core/app_const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(MockStuffRepositoryImpl());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() async {
    await _controller.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onCreate,
      ),
      body: StuffListView(
        itemCount: _controller.length,
        itemBuilder: _buildStuffCard,
        loading: _controller.loading,
      ),
    );
  }

  Widget _buildStuffCard(BuildContext context, int index) {
    final stuff = _controller.stuffs[index];
    return StuffCard(
      stuff: stuff,
      onUpdate: () => _onUpdate(stuff),
      onDelete: () => _onDelete(stuff),
    );
  }

  _onCreate() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailPage()),
    );
  }

  _onUpdate(StuffModel stuff) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailPage(stuff: stuff)),
    );
  }

  _onDelete(StuffModel stuff) {
    print('Delete');
  }
}
