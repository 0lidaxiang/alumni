import 'package:alumni_app/splash/splash_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/common/common.dart';
import 'package:flutter_login/home/home.dart';
import 'package:flutter_login/login/login_page.dart';
import 'package:flutter_login/splash/splash.dart';
import 'package:user_repository/user_repository.dart';

import 'authentication/authentication.dart';
import 'common/loading_indicator.dart';
import 'home/home_page.dart';
import 'login/login_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NTUST Mainland Alumni",
      theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          // 默认是已登录状态
          if (state is AuthenticationSuccess) {
            return HomePage();
          }
          // 默认非登录状态
          if (state is AuthenticationFailure) {
            return LoginPage(userRepository: userRepository);
          }
          // 登录
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}
