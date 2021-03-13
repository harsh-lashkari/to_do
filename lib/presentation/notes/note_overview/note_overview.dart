import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:to_do/application/auth/auth_bloc.dart';
import 'package:to_do/application/notes/note_actor/note_actor_bloc.dart';
import 'package:to_do/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:to_do/injection.dart';
import 'package:to_do/presentation/notes/note_overview/widgets/incomplete_note_switch.dart';
import 'package:to_do/presentation/notes/note_overview/widgets/note_overview_body_widget.dart';
import 'package:to_do/presentation/routes/router.gr.dart';
import 'package:to_do/shared/color_constants.dart';
import 'package:to_do/shared/sizeconfig.dart';

class NoteOverviewPage extends StatefulWidget {
  @override
  _NoteOverviewPageState createState() => _NoteOverviewPageState();
}

class _NoteOverviewPageState extends State<NoteOverviewPage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  // final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NoteWatcherBloc>(
            create: (context) => getIt<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted()),
          ),
          BlocProvider<NoteActorBloc>(
            create: (context) => getIt<NoteActorBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeMap(
                  unauthenticated: (_) => ExtendedNavigator.of(context)
                      .replace(Routes.signInPageBlocProvider),
                  orElse: () {},
                );
              },
            ),
            BlocListener<NoteActorBloc, NoteActorState>(
              listener: (context, state) {
                state.maybeMap(
                  deleteFailure: (state) {
                    FlushbarHelper.createError(
                      duration: const Duration(seconds: 5),
                      message: state.noteFailure.map(
                        unexpected: (_) =>
                            'Unexpected error occurred while deleting!',
                        insufficientPermission: (_) =>
                            'Insufficient Permissions!',
                        unableToUpdate: (_) => 'Unable to update!',
                      ),
                    ).show(context);
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: SideMenu(
            radius: BorderRadius.circular(25),
            inverse: true,
            key: _sideMenuKey,
            menu: buildMenu(context),
            type: SideMenuType.slideNRotate,
            child: Scaffold(
              extendBody: true,
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 25,
                      right: SizeConfig.blockSizeHorizontal * 25,
                      top: SizeConfig.blockSizeVertical * 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notes',
                          style: GoogleFonts.quicksand(
                            fontSize: SizeConfig.safeBlockVertical * 50,
                            // fontWeight: FontWeight.w300,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            final _state = _sideMenuKey.currentState;
                            if (_state.isOpened) {
                              _state.closeSideMenu();
                            } else {
                              _state.openSideMenu();
                            }
                          },
                          child: Container(
                            width: SizeConfig.blockSizeVertical * 50,
                            height: SizeConfig.blockSizeVertical * 50,
                            decoration: BoxDecoration(
                              color: kLightBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              // FeatherIcons.moon,
                              // SimpleLineIcons.menu,
                              FeatherIcons.menu,
                              size: SizeConfig.safeBlockVertical * 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 20,
                      right: SizeConfig.blockSizeHorizontal * 20,
                    ),
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 500,
                      height: SizeConfig.safeBlockVertical * 50,
                      decoration: BoxDecoration(
                        color: kLightBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 20,
                          right: SizeConfig.safeBlockHorizontal * 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              FeatherIcons.search,
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 10,
                            ),
                            Expanded(
                              child: BlocBuilder<NoteWatcherBloc,
                                  NoteWatcherState>(
                                builder: (context, state) {
                                  return TextField(
                                    onChanged: (value) {
                                      context
                                          .read<NoteWatcherBloc>()
                                          .add(NoteWatcherEvent.search(value));
                                    },
                                    style: GoogleFonts.roboto(),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search...',
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 10,
                            ),
                            const Icon(
                              FeatherIcons.mic,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 25,
                      right: SizeConfig.blockSizeHorizontal * 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncompleteSwitch(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 10,
                  ),
                  const Expanded(
                    child: NotesOverviewBody(),
                  ),
                ],
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 125,
                ),
                child: SizedBox(
                  height: SizeConfig.safeBlockVertical * 60,
                  width: SizeConfig.safeBlockVertical * 120,
                  child: FloatingActionButton(
                    // elevation: 0,
                    splashColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    onPressed: () {
                      ExtendedNavigator.of(context)
                          .pushNoteFormPage(editedNote: null);
                    },
                    child: Icon(
                      FeatherIcons.plus,
                      size: SizeConfig.safeBlockVertical * 30,
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  height: SizeConfig.safeBlockVertical * 125,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildMenu(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      // Padding(
      //   padding: EdgeInsets.only(
      //     top: SizeConfig.safeBlockVertical * 50,
      //     right: SizeConfig.safeBlockVertical * 30,
      //   ),
      //   child: Container(
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(25),
      //         border: Border.all(
      //           color: Colors.white,
      //           width: 3,
      //         )),
      //     child: ToggleSwitch(
      //       minWidth: 100.0,
      //       // initialLabelIndex: 0,
      //       cornerRadius: 20.0,
      //       activeFgColor: Colors.white,
      //       inactiveBgColor: Colors.white,
      //       inactiveFgColor: Colors.black,
      //       labels: const ['Light', 'Dark'],
      //       icons: const [FeatherIcons.sun, FeatherIcons.moon],
      //       activeBgColors: const [Colors.blue, Colors.blue],
      //       onToggle: (val) {
      //         changeTheme.setTheme(dark: !changeTheme.themeMode);
      //         ExtendedNavigator.of(context).replace(Routes.appWidget);
      //       },
      //     ),
      //   ),
      // ),
      const Spacer(),
      Padding(
        padding: EdgeInsets.only(
          right: SizeConfig.safeBlockHorizontal * 50,
          bottom: SizeConfig.safeBlockVertical * 50,
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'LOGOUT',
                    style: GoogleFonts.quicksand(
                      fontSize: SizeConfig.blockSizeVertical * 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 10,
                  ),
                  Icon(
                    FeatherIcons.logOut,
                    size: SizeConfig.safeBlockVertical * 24,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
