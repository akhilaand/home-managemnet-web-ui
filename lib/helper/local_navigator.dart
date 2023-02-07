import 'package:flutter/widgets.dart';
import 'package:home_management_week6/routing/routes.dart';

import '../constants/controller.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: livingRoomRoute,
      onGenerateRoute: generateRoute,
    );
