import 'package:custom_youtube_client/videos_list/domain/state/videos_list_cubit.dart';
import 'package:custom_youtube_client/videos_list/domain/state/videos_list_state.dart';
import 'package:custom_youtube_client/videos_list/presentation/components/app_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/videos_list_repository.dart';

class VideosListScreen extends StatelessWidget {
  const VideosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideosListCubit(repository: GetIt.I.get<VideosListRepository>())
            ..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('titile'),
        ),
        body: BlocBuilder<VideosListCubit, VideosListState>(
          builder: (context, state) {
            if (state is VideosListEmpty) {
              return const SizedBox.shrink();
            }
            state as VideosListWithData;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              itemCount: state.data.length,
              itemBuilder: (context, index) => AppPlayer(
                url: state.data[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 32,
              ),
            );
          },
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              final cubit = context.read<VideosListCubit>();
              final String? url = await showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextField(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop('asd');
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  );
                },
              );
              if (url != null) {
                cubit.addVideo('https://www.youtube.com/watch?v=X8W-6RDHqxM');
              }
            },
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
