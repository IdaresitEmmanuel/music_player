import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';

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
                        const Icon(Icons.delete_rounded)
                      ]),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.queue.length,
                      itemBuilder: (context, index) {
                        final music = state.queue[index];
                        return ListTile(
                          leading: const Icon(Icons.drag_handle_rounded),
                          title: Text(
                            music.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: state.currentIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color),
                          ),
                          subtitle: Text(
                            music.artist ?? "<unknown>",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: state.currentIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color),
                          ),
                          trailing: const Icon(Icons.close_rounded),
                        );
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
