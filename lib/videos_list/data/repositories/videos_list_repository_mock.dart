import '../../domain/repositories/videos_list_repository.dart';

class VideosListRepositoryMock extends VideosListRepository {
  @override
  List<String> readVideos() {
    return [
      'https://www.youtube.com/watch?v=X8W-6RDHqxM',
      'https://www.youtube.com/watch?v=SO_wtrHkWDo',
    ];
  }

  @override
  void saveVideo() {}
}
