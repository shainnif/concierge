import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'app_header.dart';
import 'src/services/database_service.dart';
import 'src/directives/vu_scroll_down.dart';
import 'src/directives/vu_hold_focus.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [CORE_DIRECTIVES, materialDirectives, AppHeader,  VuScrollDown, VuHoldFocus],
  providers: const [materialProviders, DatabaseService]
)
class AppComponent {
  final DatabaseService dbService;
  String inputText = "";
  AppComponent(DatabaseService this.dbService);

  void sendTextMessage() {
    String messageText = inputText.trim();

    if (messageText.isNotEmpty) {
      dbService.sendMessage(text: messageText);
      inputText = "";
    }
  }
  void sendImageMessage(FileList files) {
    if (files.isNotEmpty) {
      dbService.sendImage(files.first);
    }
  }
}
