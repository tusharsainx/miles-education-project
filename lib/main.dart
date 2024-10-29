import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:miles_ed_project/bottom_navigator/me_bottom_navigator.dart';
import 'package:miles_ed_project/bottom_navigator/me_bottom_navigator_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const StartupRoute());
}

class StartupRoute extends StatelessWidget {
  const StartupRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      getPages: [
        GetPage(
          name: "/homepage",
          page: () => const MeBottomNavigator(),
          binding: MeBottomNavigatorBinding(),
        )
      ],
    );
  }
}
