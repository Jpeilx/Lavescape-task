import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavescape/core/network/local/cache_helper.dart';
import 'package:lavescape/core/network/remote/dio_helper/dio_helper.dart';
import 'package:lavescape/core/services/service_locator.dart';
import 'package:lavescape/core/shared/core_widgets/bloc_observer.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/router/app_router.dart';
import 'package:lavescape/core/utils/themes/app_theme.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.kWhiteColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.kWhiteColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(),
          );
        });
  }
}
