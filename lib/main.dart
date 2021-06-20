import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/pages/splash/splash_page.dart';
import 'package:web_app/theme/style.dart';
import 'package:web_app/Login/repository/user_repository.dart';


import 'package:web_app/Login/auth_bloc/authentication_bloc.dart';
import 'package:web_app/Login/page/login_page.dart';
import 'common/loading_indicator.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print (transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(
              userRepository: userRepository
          )..add(AppStarted());
        },
        child: App(userRepository: userRepository),
      )
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MyYellow,
        accentColor: featureColor,
        focusColor: featureColor,
        scaffoldBackgroundColor: background,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(

        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return LoginPage(userRepository: userRepository,);
          }
          if (state is AuthenticationAuthenticated) {
            return LoginPage(userRepository: userRepository,);
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository,);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          else return LoginPage(userRepository: userRepository,);
        },

      ),
    );
  }
}