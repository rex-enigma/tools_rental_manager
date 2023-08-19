// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;
import 'package:tools_rental_management/ui/views/home/home_view.dart' as _i2;
import 'package:tools_rental_management/ui/views/image/image_view.dart' as _i10;
import 'package:tools_rental_management/ui/views/settings/settings_view.dart'
    as _i5;
import 'package:tools_rental_management/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:tools_rental_management/ui/views/tool/tool_view.dart' as _i6;
import 'package:tools_rental_management/ui/views/tool_names/tool_names_view.dart'
    as _i8;
import 'package:tools_rental_management/ui/views/tool_user/tool_user_view.dart'
    as _i9;
import 'package:tools_rental_management/ui/views/tool_users/tool_users_view.dart'
    as _i7;
import 'package:tools_rental_management/ui/views/tools/tools_view.dart' as _i4;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const toolsView = '/tools-view';

  static const settingsView = '/settings-view';

  static const toolView = '/tool-view';

  static const toolUsersView = '/tool-users-view';

  static const toolNamesView = '/tool-names-view';

  static const toolUserView = '/tool-user-view';

  static const imageView = '/image-view';

  static const all = <String>{
    homeView,
    startupView,
    toolsView,
    settingsView,
    toolView,
    toolUsersView,
    toolNamesView,
    toolUserView,
    imageView,
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
      Routes.toolUsersView,
      page: _i7.ToolUsersView,
    ),
    _i1.RouteDef(
      Routes.toolNamesView,
      page: _i8.ToolNamesView,
    ),
    _i1.RouteDef(
      Routes.toolUserView,
      page: _i9.ToolUserView,
    ),
    _i1.RouteDef(
      Routes.imageView,
      page: _i10.ImageView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.ToolsView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ToolsView(),
        settings: data,
      );
    },
    _i5.SettingsView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SettingsView(),
        settings: data,
      );
    },
    _i6.ToolView: (data) {
      final args = data.getArgs<ToolViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ToolView(key: args.key, toolId: args.toolId),
        settings: data,
      );
    },
    _i7.ToolUsersView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ToolUsersView(),
        settings: data,
      );
    },
    _i8.ToolNamesView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ToolNamesView(),
        settings: data,
      );
    },
    _i9.ToolUserView: (data) {
      final args = data.getArgs<ToolUserViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.ToolUserView(key: args.key, toolUserId: args.toolUserId),
        settings: data,
      );
    },
    _i10.ImageView: (data) {
      final args = data.getArgs<ImageViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ImageView(
            key: args.key, idImageTypeGroup: args.idImageTypeGroup),
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

  final _i11.Key? key;

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

class ToolUserViewArguments {
  const ToolUserViewArguments({
    this.key,
    required this.toolUserId,
  });

  final _i11.Key? key;

  final int toolUserId;

  @override
  String toString() {
    return '{"key": "$key", "toolUserId": "$toolUserId"}';
  }

  @override
  bool operator ==(covariant ToolUserViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.toolUserId == toolUserId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ toolUserId.hashCode;
  }
}

class ImageViewArguments {
  const ImageViewArguments({
    this.key,
    required this.idImageTypeGroup,
  });

  final _i11.Key? key;

  final ({int id, dynamic imageType}) idImageTypeGroup;

  @override
  String toString() {
    return '{"key": "$key", "idImageTypeGroup": "$idImageTypeGroup"}';
  }

  @override
  bool operator ==(covariant ImageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.idImageTypeGroup == idImageTypeGroup;
  }

  @override
  int get hashCode {
    return key.hashCode ^ idImageTypeGroup.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
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
    _i11.Key? key,
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

  Future<dynamic> navigateToToolUserView({
    _i11.Key? key,
    required int toolUserId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.toolUserView,
        arguments: ToolUserViewArguments(key: key, toolUserId: toolUserId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToImageView({
    _i11.Key? key,
    required ({int id, dynamic imageType}) idImageTypeGroup,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.imageView,
        arguments:
            ImageViewArguments(key: key, idImageTypeGroup: idImageTypeGroup),
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
    _i11.Key? key,
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

  Future<dynamic> replaceWithToolUserView({
    _i11.Key? key,
    required int toolUserId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.toolUserView,
        arguments: ToolUserViewArguments(key: key, toolUserId: toolUserId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithImageView({
    _i11.Key? key,
    required ({int id, dynamic imageType}) idImageTypeGroup,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.imageView,
        arguments:
            ImageViewArguments(key: key, idImageTypeGroup: idImageTypeGroup),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
