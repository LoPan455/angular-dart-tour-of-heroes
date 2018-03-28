import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/app_component.dart';
import 'package:http/browser_client.dart';
import 'package:angular_app/in_memory_data_service.dart';
import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    // Remove next line in production
    provide(LocationStrategy, useClass: HashLocationStrategy),
    // provide(BrowserClient, useFactory: () => new BrowserClient(), deps: [])
    provide(Client, useClass: InMemoryDataService),
  ]);
}
