import 'package:flutter_application_1/Home/HomeView.dart';
import 'package:flutter_application_1/Navigations/ChatPage/ChatService.dart';
import 'package:flutter_application_1/Screens/OnBoardingPage.dart';
import 'package:flutter_application_1/Screens/OnBoardingPage2.dart';
import 'package:flutter_application_1/Screens/OnBoardingPage3.dart';
import 'package:flutter_application_1/Screens/SplashScreen.dart';
import 'package:flutter_application_1/Views/LoginView.dart';
import 'package:flutter_application_1/Views/SignUpView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: OnBoardingPage),
    MaterialRoute(page: OnBoardingPage2),
    MaterialRoute(page: OnBoardingPage3),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: ChatService),
  ],
)
class App {}
