import 'package:custom_youtube_client/videos_list/data/repositories/videos_list_repository_mock.dart';
import 'package:custom_youtube_client/videos_list/domain/repositories/videos_list_repository.dart';
import 'package:custom_youtube_client/videos_list/presentation/screens/videos_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I
      .registerFactory<VideosListRepository>(() => VideosListRepositoryMock());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VideosListScreen(),
    );
  }
}
