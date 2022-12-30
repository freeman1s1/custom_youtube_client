abstract class VideosListState{}

class VideosListEmpty extends VideosListState{}

class VideosListWithData extends VideosListState{
  final List<String> data;

  VideosListWithData({required this.data});
}