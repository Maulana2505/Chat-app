// ignore_for_file: prefer_const_constructors

import 'package:chat_app/bloc/chat/chat_bloc.dart';
import 'package:chat_app/bloc/chat/chat_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/auth/auth_bloc.dart';
import 'package:chat_app/bloc/auth/auth_event.dart';
import 'package:chat_app/bloc/auth/auth_state.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_bloc.dart';
import 'package:chat_app/bloc/friendRequest/friendreq_event.dart';
import 'package:chat_app/bloc/friends/friends_bloc.dart';
import 'package:chat_app/bloc/friends/friends_event.dart';
import 'package:chat_app/bloc/pending/pending_bloc.dart';
import 'package:chat_app/bloc/pending/pending_event.dart';
import 'package:chat_app/bloc/profileuser/profileuser_bloc.dart';
import 'package:chat_app/bloc/profileuser/profileuser_event.dart';
import 'package:chat_app/bloc/search/search_bloc.dart';
import 'package:chat_app/bloc/search/search_event.dart';
import 'package:chat_app/bloc/signup/signup_bloc.dart';
import 'package:chat_app/page/navigation/profile_two.dart';
import 'package:chat_app/page/signin.dart';
import 'package:chat_app/page/signup.dart';
import 'package:chat_app/page/welcomepage.dart';
import 'package:chat_app/repository/token_secure.dart';
import 'package:chat_app/widget/Navigation/nav.dart';
import 'package:chat_app/widget/theme/theme.dart';

import 'bloc/signin/signin_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final token = tokensecure();
    final userapi = userApi();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(token)..add(AppStarted())),
        BlocProvider<SignupBloc>(create: (context) => SignupBloc(userapi)),
        BlocProvider<SigninBloc>(
          create: (context) => SigninBloc(userapi),
          child: Container(),
        ),
        BlocProvider<ProfileuserBloc>(
          create: (context) =>
              ProfileuserBloc()..add(ProfileuserLoadDataEvent()),
        ),
        BlocProvider<PendingBloc>(
            create: (context) => PendingBloc()..add(PendingLoadDataEvent())),
        BlocProvider<FriendreqBloc>(
            create: (context) =>
                FriendreqBloc()..add(FriendreqLoadDataEvent())),
        BlocProvider<SearchBloc>(
            create: (context) =>
                SearchBloc()..add(SearchLoadDataEvent(query: ""))),
        BlocProvider<FriendsBloc>(
            create: (context) => FriendsBloc()..add(FriendsLoadDataEvent())),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc()..add(ChatLoadDataEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        theme: Mythemes().lightTheme,
        darkTheme: Mythemes().darktheme,
        themeMode: ThemeMode.system,
        home:
            // Navbar(),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              // socket().StatusUsers(TokenApi().getid().toString());
              // socket().connect();
              return Navbar();
            }
            if (state is AuthenticationUnauthenticated) {
              return Welcomepage();
            }
            if (state is AuthenticationLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
        routes: {
          '/signin': (context) => Signin(),
          '/signup': (context) => Signup(),
          '/profiletwo': (context) => ProfileTwo(),
        },
      ),
    );
  }
}
