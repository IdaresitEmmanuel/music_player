import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/presentation/bloc/search_bloc/search_bloc.dart';

class SearchCategoryWidget extends StatelessWidget {
  const SearchCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20.0),
              GestureDetector(
                onTap: () => context
                    .read<SearchBloc>()
                    .add(SetSearchCategoryEvent(SearchCategory.songs)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: state.searchCategory == SearchCategory.songs
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.headphones_rounded,
                        color: state.searchCategory == SearchCategory.songs
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyMedium!.color,
                        size: 16.0,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "Songs",
                        style: TextStyle(
                          color: state.searchCategory == SearchCategory.songs
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyMedium!.color,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () => context
                    .read<SearchBloc>()
                    .add(SetSearchCategoryEvent(SearchCategory.aritst)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: state.searchCategory == SearchCategory.aritst
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 16.0,
                        color: state.searchCategory == SearchCategory.aritst
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "Artists",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: state.searchCategory == SearchCategory.aritst
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () => context
                    .read<SearchBloc>()
                    .add(SetSearchCategoryEvent(SearchCategory.album)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: state.searchCategory == SearchCategory.album
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.album_rounded,
                        size: 16.0,
                        color: state.searchCategory == SearchCategory.album
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "Albums",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: state.searchCategory == SearchCategory.album
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: () => context
                    .read<SearchBloc>()
                    .add(SetSearchCategoryEvent(SearchCategory.folder)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: state.searchCategory == SearchCategory.folder
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder_rounded,
                        size: 16.0,
                        color: state.searchCategory == SearchCategory.folder
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "Folders",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: state.searchCategory == SearchCategory.folder
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        );
      },
    );
  }
}
