import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';

import '../../../domain/entities/music.dart';

class Queue extends StatefulWidget {
  const Queue({Key? key}) : super(key: key);

  @override
  State<Queue> createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimentions.pageMargin, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close_rounded)),
                        Text("Queue(${state.queue.length})",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )),
                        GestureDetector(
                            onTap: () =>
                                context.read<PlayerBloc>().add(ClearQueue()),
                            child: const Icon(Icons.delete_rounded))
                      ]),
                ),
                Expanded(
                  child: state.queue.isEmpty
                      ? const Center(child: Text("Queue is empty"))
                      : ReorderableListView.builder(
                          buildDefaultDragHandles: false,
                          itemCount: state.queue.length,
                          onReorder: (oldIndex, newIndex) => context
                              .read<PlayerBloc>()
                              .add(ReorderQueue(
                                  oldIndex: oldIndex, newIndex: newIndex)),
                          itemBuilder: (context, index) {
                            final music = state.queue[index];
                            return QueueItem(
                                key: Key(music.id.toString()),
                                index: index,
                                music: music);
                          }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class QueueItem extends StatelessWidget {
  const QueueItem({Key? key, required this.music, required this.index})
      : super(key: key);
  final Music music;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).scaffoldBackgroundColor,
      onTap: () =>
          context.read<PlayerBloc>().add(SkipToQueueItem(index: index)),
      leading: ReorderableDragStartListener(
        index: index,
        child: Icon(Icons.drag_handle_rounded,
            color: Theme.of(context).iconTheme.color),
      ),
      title: Text(
        music.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: context.read<PlayerBloc>().state.currentMusicId == music.id
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.bodyLarge!.color),
      ),
      subtitle: Text(
        music.artist ?? "<unknown>",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: context.read<PlayerBloc>().state.currentMusicId == music.id
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.bodyLarge!.color),
      ),
      trailing: GestureDetector(
          onTap: () =>
              context.read<PlayerBloc>().add(RemoveQueueItem(index: index)),
          child: const Icon(Icons.close_rounded)),
    );
  }
}
