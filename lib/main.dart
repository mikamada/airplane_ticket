import 'package:bwa_airplane_ticket/cubit/auth_cubit.dart';
import 'package:bwa_airplane_ticket/ui/pages/bonus.dart';
import 'package:bwa_airplane_ticket/ui/pages/choose_seat_page.dart';
import 'package:bwa_airplane_ticket/ui/pages/get_started_page.dart';
import 'package:bwa_airplane_ticket/ui/pages/main_page.dart';
import 'package:bwa_airplane_ticket/ui/pages/sign_in_page.dart';
import 'package:bwa_airplane_ticket/ui/pages/sign_up_page.dart';
import 'package:bwa_airplane_ticket/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/choose-seet': (context) => ChooseSeatPage(),
        },
      ),
    );
  }
}
