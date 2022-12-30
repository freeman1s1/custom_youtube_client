import 'package:custom_youtube_client/videos_list/domain/repositories/videos_list_repository.dart';
import 'package:custom_youtube_client/videos_list/domain/state/videos_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosListCubit extends Cubit<VideosListState> {
  final VideosListRepository repository;

  VideosListCubit({
    required this.repository,
  }) : super(VideosListEmpty());

  void init() {
    final data = repository.readVideos();
    emit(
      VideosListWithData(data: data),
    );
  }

  void addVideo(String url) {
    if (state is VideosListWithData) {
      final List<String> data = [...(state as VideosListWithData).data];
      data.add(url);
      emit(VideosListWithData(data: data));
    } else if (state is VideosListEmpty) {
      emit(VideosListWithData(data: [url]));
    }
  }
}
