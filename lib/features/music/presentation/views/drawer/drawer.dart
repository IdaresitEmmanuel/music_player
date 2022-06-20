import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/colors.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/player/equalizer.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width * .8,
      child: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
            height: 100.0,
            child: Row(children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.graphic_eq_rounded,
                  color: AppColors.iconColor,
                ),
              ),
              const SizedBox(width: 10),
              const Text('Music Player', style: TextStyle(fontSize: 20))
            ]),
          ),
          ListTile(
            leading: Icon(
              Icons.home_rounded,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            title: const Text("Home"),
          ),
          ListTile(
            leading: Icon(
              Icons.library_books_rounded,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            title: const Text("Library"),
          ),
          ListTile(
            leading: Icon(
              Icons.history_rounded,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            title: const Text("History"),
          ),
          const Divider(thickness: .3),
          ListTile(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
              showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                      backgroundColor: Colors.transparent, child: Equalizer()));
            },
            leading: Icon(
              Icons.graphic_eq_rounded,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            title: const Text("Equalizer"),
          ),
          const NightTile(),
          ListTile(
            leading: Icon(
              Icons.settings_rounded,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            title: const Text("Settings"),
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_rounded,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            title: const Text("Help"),
          ),
        ],
      )),
    );
  }
}

class NightTile extends StatelessWidget {
  const NightTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            if (state.theme == ThemeSetting.dark) {
              context
                  .read<SettingsBloc>()
                  .add(SetThemeEvent(theme: ThemeSetting.light));
            } else {
              context
                  .read<SettingsBloc>()
                  .add(SetThemeEvent(theme: ThemeSetting.dark));
            }
          },
          leading: Icon(
            Icons.nightlight,
            color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
          ),
          title: const Text("Night mode"),
          trailing: Switch(
              activeColor: Theme.of(context).primaryColor,
              value: state.theme == ThemeSetting.dark ? true : false,
              onChanged: (value) {
                if (state.theme == ThemeSetting.dark) {
                  context
                      .read<SettingsBloc>()
                      .add(SetThemeEvent(theme: ThemeSetting.light));
                } else {
                  context
                      .read<SettingsBloc>()
                      .add(SetThemeEvent(theme: ThemeSetting.dark));
                }
              }),
        );
      },
    );
  }
}
