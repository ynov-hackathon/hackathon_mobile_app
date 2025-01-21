import 'package:get_it/get_it.dart';
import 'package:hackathon_mobile_app/services/product_service.dart';
import 'package:hackathon_mobile_app/viewmodels/home_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/product_details_viewmodel.dart';
import 'package:logger/logger.dart';

/// A global instance of the service locator from the `GetIt` package.
/// 
/// This instance is used to register and retrieve dependencies throughout the application.
GetIt locator = GetIt.instance;

/// Registers service classes with the service locator.
/// 
/// This function registers singleton instances of services that are used across the app.
void registerServices() {
  locator.registerSingleton<ProductService>(ProductService());
}

/// Registers view model classes with the service locator.
/// 
/// This function registers factory methods for creating view models.
/// View models are created on-demand and are not shared across the app.
void registerViewModels() {
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ProductDetailsViewModel>(() => ProductDetailsViewModel());
}

/// Registers provider classes with the service locator.
/// 
/// This function is currently unimplemented and throws an [UnimplementedError].
void registerProviders() {
  throw UnimplementedError();
}

/// Sets up the service locator by registering all dependencies.
/// 
/// This function initializes the logger, registers services, view models, and providers,
/// and waits for all asynchronous registrations to complete. 
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