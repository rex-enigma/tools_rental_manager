// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;
import 'package:tools_rental_management/ui/views/back_national_id_image/back_national_id_image_view.dart'
    as _i15;
import 'package:tools_rental_management/ui/views/front_national_id_image/front_national_id_image_view.dart'
    as _i14;
import 'package:tools_rental_management/ui/views/home/home_view.dart' as _i2;
import 'package:tools_rental_management/ui/views/settings/settings_view.dart'
    as _i5;
import 'package:tools_rental_management/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:tools_rental_management/ui/views/tool/tool_view.dart' as _i6;
import 'package:tools_rental_management/ui/views/tool_image/tool_image_view.dart'
    as _i13;
import 'package:tools_rental_management/ui/views/tool_names/tool_names_view.dart'
    as _i10;
import 'package:tools_rental_management/ui/views/tool_search/tool_search_view.dart'
    as _i7;
import 'package:tools_rental_management/ui/views/tool_user/tool_user_view.dart'
    as _i12;
import 'package:tools_rental_management/ui/views/tool_user_image/tool_user_image_view.dart'
    as _i11;
import 'package:tools_rental_management/ui/views/tool_user_search/tool_user_search_view.dart'
    as _i9;
import 'package:tools_rental_management/ui/views/tool_users/tool_users_view.dart'
    as _i8;
import 'package:tools_rental_management/ui/views/tools/tools_view.dart' as _i4;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const toolsView = '/tools-view';

  static const settingsView = '/settings-view';

  static const toolView = '/tool-view';

  static const toolSearchView = '/tool-search-view';

  static const toolUsersView = '/tool-users-view';

  static const toolUserSearchView = '/tool-user-search-view';

  static const toolNamesView = '/tool-names-view';

  static const toolUserImageView = '/tool-user-image-view';

  static const toolUserView = '/tool-user-view';

  static const toolImageView = '/tool-image-view';

  static const frontNationalIdImageView = '/front-national-id-image-view';

  static const backNationalIdImageView = '/back-national-id-image-view';

  static const all = <String>{
    homeView,
    startupView,
    toolsView,
    settingsView,
    toolView,
    toolSearchView,
    toolUsersView,
    toolUserSearchView,
    toolNamesView,
    toolUserImageView,
    toolUserView,
    toolImageView,
    frontNationalIdImageView,
    backNationalIdImageView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.toolsView,
      page: _i4.ToolsView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i5.SettingsView,
    ),
    _i1.RouteDef(
      Routes.toolView,
      page: _i6.ToolView,
    ),
    _i1.RouteDef(
      Routes.toolSearchView,
      page: _i7.ToolSearchView,
    ),
    _i1.RouteDef(
      Routes.toolUsersView,
      page: _i8.ToolUsersView,
    ),
    _i1.RouteDef(
      Routes.toolUserSearchView,
      page: _i9.ToolUserSearchView,
    ),
    _i1.RouteDef(
      Routes.toolNamesView,
      page: _i10.ToolNamesView,
    ),
    _i1.RouteDef(
      Routes.toolUserImageView,
      page: _i11.ToolUserImageView,
    ),
    _i1.RouteDef(
      Routes.toolUserView,
      page: _i12.ToolUserView,
    ),
    _i1.RouteDef(
      Routes.toolImageView,
      page: _i13.ToolImageView,
    ),
    _i1.RouteDef(
      Routes.frontNationalIdImageView,
      page: _i14.FrontNationalIdImageView,
    ),
    _i1.RouteDef(
      Routes.backNationalIdImageView,
      page: _i15.BackNationalIdImageView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.ToolsView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ToolsView(),
        settings: data,
      );
    },
    _i5.SettingsView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SettingsView(),
        settings: data,
      );
    },
    _i6.ToolView: (data) {
      final args = data.getArgs<ToolViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ToolView(key: args.key, toolId: args.toolId),
        settings: data,
      );
    },
    _i7.ToolSearchView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ToolSearchView(),
        settings: data,
      );
    },
    _i8.ToolUsersView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ToolUsersView(),
        settings: data,
      );
    },
    _i9.ToolUserSearchView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ToolUserSearchView(),
        settings: data,
      );
    },
    _i10.ToolNamesView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ToolNamesView(),
        settings: data,
      );
    },
    _i11.ToolUserImageView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ToolUserImageView(),
        settings: data,
      );
    },
    _i12.ToolUserView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ToolUserView(),
        settings: data,
      );
    },
    _i13.ToolImageView: (data) {
      final args = data.getArgs<ToolImageViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.ToolImageView(key: args.key, toolId: args.toolId),
        settings: data,
      );
    },
    _i14.FrontNationalIdImageView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.FrontNationalIdImageView(),
        settings: data,
      );
    },
    _i15.BackNationalIdImageView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.BackNationalIdImageView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ToolViewArguments {
  const ToolViewArguments({
    this.key,
    required this.toolId,
  });

  final _i16.Key? key;

  final int toolId;

  @override
  String toString() {
    return '{"key": "$key", "toolId": "$toolId"}';
  }

  @override
  bool operator ==(covariant ToolViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.toolId == toolId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ toolId.hashCode;
  }
}

class ToolImageViewArguments {
  const ToolImageViewArguments({
    this.key,
    required this.toolId,
  });

  final _i16.Key? key;

  final int toolId;

  @override
  String toString() {
    return '{"key": "$key", "toolId": "$toolId"}';
  }

  @override
  bool operator ==(covariant ToolImageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.toolId == toolId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ toolId.hashCode;
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolView({
    _i16.Key? key,
    required int toolId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.toolView,
        arguments: ToolViewArguments(key: key, toolId: toolId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolSearchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolUsersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolUserSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolUserSearchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolNamesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolNamesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolUserImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolUserImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toolUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToolImageView({
    _i16.Key? key,
    required int toolId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.toolImageView,
        arguments: ToolImageViewArguments(key: key, toolId: toolId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFrontNationalIdImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.frontNationalIdImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBackNationalIdImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.backNationalIdImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolView({
    _i16.Key? key,
    required int toolId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.toolView,
        arguments: ToolViewArguments(key: key, toolId: toolId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolSearchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolUsersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolUsersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolUserSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolUserSearchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolNamesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolNamesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolUserImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolUserImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toolUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToolImageView({
    _i16.Key? key,
    required int toolId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.toolImageView,
        arguments: ToolImageViewArguments(key: key, toolId: toolId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFrontNationalIdImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.frontNationalIdImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBackNationalIdImageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.backNationalIdImageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
