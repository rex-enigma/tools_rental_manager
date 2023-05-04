import 'package:drift/drift.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/data/data_models/tooluser.dart';
import 'package:tools_rental_management/database/app_database.dart';
import 'package:tools_rental_management/database/toolusers/toolusers_table.dart';

part 'toolusers_dao.g.dart';

@DriftAccessor(tables: [ToolUsers])
class ToolUsersDao extends DatabaseAccessor<AppDatabase>
    with _$ToolUsersDaoMixin {
  ToolUsersDao(AppDatabase db) : super(db);

  Future<int> insertToolUser(ToolUser toolUser) {
    return customInsert(
      """INSERT INTO tool_users (
          first_name, 
          last_name, 
          front_national_id_image_path, 
          back_national_id_image_path, 
          avatar_image_path, 
          phone_number, 
          country_calling_code
        )
        VALUES (
          :firstName, 
          :lastName, 
          :frontNationalIdImagePath, 
          :backNationalIdImagePath, 
          :avatarImagePath, 
          :phoneNumber, 
          :countryCallingCode
        )""",
      variables: [
        Variable.withString(toolUser.firstName),
        Variable.withString(toolUser.lastName),
        Variable.withString(toolUser.frontNationalIdImagePath),
        Variable.withString(toolUser.backNationalIdImagePath),
        Variable.withString(toolUser.avatarImagePath),
        Variable.withInt(toolUser.phoneNumber),
        Variable.withInt(toolUser.countryCallingCode),
      ],
    ).catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stackTrace: $stackTrace');
      throw Exception(e);
    });
  }

  // this kind of update is not optimized because it end up updating columns of a particular row that don't need updating.
  Future<int> updateToolUser(ToolUser toolUser) {
    return customUpdate(
      """UPDATE tool_users 
      SET
        first_name = :firstName, 
        last_name = :lastName, 
        front_national_id_image_path = :frontNationalIdImagePath, 
        back_national_id_image_path = :backNationalIdImagePath,
        avatar_image_path = :avatarImagePath,
        phone_number = :phoneNumber,
        countryCallingCode = :countryCallingCode
      WHERE 
        tool_user_id = :toolUserId
       """,
      variables: [
        Variable.withString(toolUser.firstName),
        Variable.withString(toolUser.lastName),
        Variable.withString(toolUser.frontNationalIdImagePath),
        Variable.withString(toolUser.backNationalIdImagePath),
        Variable.withString(toolUser.avatarImagePath),
        Variable.withInt(toolUser.phoneNumber),
        Variable.withInt(toolUser.countryCallingCode),
        Variable(toolUser.toolUserId),
      ],
    ).catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stackTrace: $stackTrace');
      throw Exception(e);
    });
  }

  Future<int> deleteToolUserById(int toolUserId) {
    return customUpdate(
      'DELETE FROM tool_users WHERE tool_user_id = :toolUserId',
      variables: [Variable.withInt(toolUserId)],
    ).catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stackTrace: $stackTrace');
      throw Exception(e);
    });
  }

  Future<int> deleteAllToolUsers() {
    return customUpdate('DELETE FROM tool_users')
        .catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stackTrace: $stackTrace');
      throw Exception(e);
    });
  }

  Future<ToolUser?> getToolUserByIdOrNull(int toolUserId) async {
    final toolUserResult = await customSelect(
      'SELECT * FROM tool_users WHERE tool_user_id = :toolUserId',
      variables: [Variable.withInt(toolUserId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a toolUser) for the given toolUserId, or null if there is no row(toolUser) for the given toolUserId.
        .catchError((Object e, StackTrace stackTrace) {
      print('Error: $e, stacktrace: $stackTrace');
      throw Exception(e);
    });

    // toolUserResult might be null if their isn't any toolUser for the given toolUserId
    // just return null in that situation.
    if (toolUserResult == null) return null;

    // if null isn't returned then it means at this point their is a toolUser for the given toolUserId.

    // get all tools for the given toolUserId
    // the toolResults might contain a list of queryRows(will be tools after transformation) for a specified toolUser or empty list
    // if their isn't any tools associated with the toolUser yet.
    final toolResults = await customSelect(
      'SELECT * FROM tools WHERE tool_user_id = :toolUserId',
      variables: [Variable.withInt(toolUserId)],
    ).get().catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stackTrace: $stacktrace');
      throw Exception(e);
    });

    // construct a toolUserMap that contains the same data as [toolUserResult.data] that represents a [ToolUser]
    // and use it to add another key/value pair where 'tools' is key and [null] or [list of tools] is the value.
    Map<String, dynamic> toolUserMap = {...toolUserResult.data};

    // toolsResult might be empty if their isn't any tools for the given toolUserId.
    if (toolResults.isEmpty) {
      // since the toolResults is empty which means their aren't any tools for the toolUser of the specified
      // toolUserId, add a 'tools' key with [null] value to [toolUserMap] to indicate that.
      toolUserMap['tools'] = null;

      // a [ToolUser] without [Tool(s)]
      return ToolUser.fromMap(toolUserMap: toolUserMap);
    } else {
      // transform a list of 'tools queryRow' into a list of tools [Tool].
      List<Tool> toolList = toolResults.map((queryRow) {
        final toolMap = queryRow.data;
        Tool tool = Tool.fromMap(toolMap: toolMap);
        return tool;
      }).toList();

      // since the toolResults isn't empty which means their is tool(s) for the toolUser of the specified
      // toolUserId, add a 'tools' key with a [toolList] value to [toolUserMap] to indicate that.
      toolUserMap['tools'] = toolList;

      // a [ToolUser] with [Tool](s)
      return ToolUser.fromMap(toolUserMap: toolUserMap);
    }
  }

  Future<List<ToolUser>?> getAllToolUsersOrNull() async {
    final toolUserResults = await customSelect(
      'SELECT * FROM tool_users',
    ).get().catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw Exception(e);
    });

    // toolUserResults might be empty if their isn't any toolUsers records in the tool_users' table
    // so we check first.
    if (toolUserResults.isEmpty) {
      // return null to indicate that their aren't any [ToolUser](s) in the tool_users' table.
      return null;
    } else {
      final toolResults = await customSelect(
        'SELECTS * FROM tools',
      ).get().catchError((Object e, StackTrace stacktrace) {
        print('Error: $e, stacktrace: $stacktrace');
        throw Exception(e);
      });

      // construct a list of toolUserMap from list of queryRow (toolUsersResults)
      // and use it to add another key/value pair in each toolUserMap in [toolUserListMaps]
      // where 'tools' is key and [null] or [list of tools] is the value.
      List<Map<String, dynamic>> toolUserListMaps = [
        for (var queryRow in toolUserResults) queryRow.data
      ];

      if (toolResults.isEmpty) {
        // since the toolResults is empty which means their aren't any tools in the tools table,
        // add a 'tools' key with [null] value in each toolUserMap in toolUserListMaps to indicate that no
        // [ToolUser] has any [Tool](s) yet.
        // then construct a list of [ToolUser](s) with null tools.
        List<ToolUser> toolUserList = toolUserListMaps.map((toolUserMap) {
          toolUserMap['tools'] = null;
          return ToolUser.fromMap(toolUserMap: toolUserMap);
        }).toList();

        return toolUserList;
      } else {
        // at this point, tools and toolUsers records are available.

        // transform list of queryRows to a list of toolMaps
        List<Map<String, dynamic>> toolMaps =
            toolResults.map((queryRow) => queryRow.data).toList();

        List<ToolUser> toolUserList = toolUserListMaps.map((toolUserMap) {
          // filter and return a list of toolMap for the specified toolUserMap.
          // an empty list might be returned if the specified toolUser don't have corresponding tool(s) yet.
          List<Map<String, dynamic>> toolMapsForTheSpecifiedToolUserMap =
              toolMaps
                  .where(
                    (toolMap) =>
                        toolUserMap['tool_user_id'] == toolMap['tool_user_id'],
                  )
                  .toList();

          // check if there is any toolMap(s) for the specified toolUserMap, if the toolMapsForTheSpecifiedToolUserMap is empty,
          // then the specified toolUserMap does't have any corresponding toolMaps yet.
          // then just return the corresponding [ToolUser] with no corresponding [Tool](s).
          if (toolMapsForTheSpecifiedToolUserMap.isEmpty) {
            // add a 'tools' key with [null] value in [toolUserMap] to indicate that the
            // toolUserMap has no any corresponding toolMap yet.
            toolUserMap['tools'] = null;
            return ToolUser.fromMap(toolUserMap: toolUserMap);
          }

          // if the above condition is false, then the specified toolUserMap has corresponding toolMap(s),
          // build the [Tool]s first
          List<Tool> toolsForASpecifiedToolUser =
              toolMapsForTheSpecifiedToolUserMap
                  .map(
                    (toolMap) => Tool.fromMap(toolMap: toolMap),
                  )
                  .toList();

          // then since the toolMapsForTheSpecifiedToolUserMap isn't empty which means their is toolMap(s) for the toolUserMap,
          // add a 'tools' key with a [toolMapsForTheSpecifiedToolUserMap] value to [toolUserMap] to indicate that.
          toolUserMap['tools'] = toolsForASpecifiedToolUser;

          return ToolUser.fromMap(toolUserMap: toolUserMap);
        }).toList();

        return toolUserList;
      }
    }
  }
}
