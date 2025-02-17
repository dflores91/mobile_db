import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_coding_challenge/app/application/config/injectable.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart';
import 'package:mobile_coding_challenge/app/presentation/navigation/navigation_service.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:mobile_coding_challenge/home/presentation/home/home_screen.dart';

Future<void> mainConfig(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  await dotenv.load(fileName: "assets/.env");

  await configureInjection(environment);

  await getIt<FlavorConfig>().initializeEnvironment();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RootCubit>(
          create:
              (context) =>
                  getIt<RootCubit>()
                    ..getGenres()
                    ..getMovies()
                    ..getPlayNowMovies()
                    ..getPopularMovies()
                    ..getUpcomingMovies()
                    ..getTopRatedMovies()
                    ..getWishlist(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          FlutterNativeSplash.remove();
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: yellow,
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
            ),
            localizationsDelegates: [
              FlutterI18nDelegate(
                translationLoader: FileTranslationLoader(
                  fallbackFile: 'es',
                  decodeStrategies: [YamlDecodeStrategy()],
                ),
              ),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale("es"), Locale("en")],
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
