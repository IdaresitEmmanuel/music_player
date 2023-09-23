import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({Key? key}) : super(key: key);

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final textController = TextEditingController();
  final ValueNotifier<bool> clearNotifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimentions.pageMargin,
        vertical: 10.0,
      ),
      child: Row(children: [
        InkResponse(
            radius: 20,
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        const SizedBox(width: 10.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(children: [
              const Hero(tag: "search", child: Icon(Icons.search)),
              const SizedBox(width: 5.0),
              Expanded(
                child: TextField(
                  controller: textController,
                  onChanged: (value) {
                    clearNotifier.value = value.isEmpty ? false : true;
                    context.read<SearchBloc>().add(SearchAll(value));
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      isDense: true,
                      hintText: "Search..."),
                ),
              ),
              const SizedBox(width: 5.0),
              ValueListenableBuilder(
                  valueListenable: clearNotifier,
                  builder: (context, bool shouldShow, Widget? child) {
                    return shouldShow
                        ? GestureDetector(
                            onTap: () {
                              textController.text = "";
                              clearNotifier.value = false;
                              context.read<SearchBloc>().add(SearchAll(""));
                            },
                            child: const Icon(Icons.close_rounded))
                        : const SizedBox.shrink();
                  })
            ]),
          ),
        ),
        const SizedBox(width: 10.0),
        InkResponse(radius: 20, onTap: () {}, child: const Icon(Icons.mic))
      ]),
    );
  }
}
