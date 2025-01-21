import 'package:get_it/get_it.dart';
import 'package:hackathon_mobile_app/services/product_service.dart';
import 'package:hackathon_mobile_app/viewmodels/home_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/product_details_viewmodel.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  locator.registerSingleton<ProductService>(ProductService());
}

void registerViewModels() {
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ProductDetailsViewModel>(() => ProductDetailsViewModel());
}

void registerProviders() {
  throw UnimplementedError();
}

Future<void> setupLocator() async {
  // register logger for dev
  locator.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
      ),
    ),
  );

  registerServices();
  registerViewModels();
  // registerProviders();
  await locator.allReady();
}