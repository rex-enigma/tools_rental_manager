import 'package:drift/drift.dart';
import 'package:tools_rental_management/data/data_models/tool.dart';
import 'package:tools_rental_management/database/app_database.dart';
import 'package:tools_rental_management/database/tools/tools_table.dart';
import 'package:tools_rental_management/enums/status.dart';

part 'tools_dao.g.dart';

@DriftAccessor(tables: [Tools])
class ToolsDao extends DatabaseAccessor<AppDatabase> with _$ToolsDaoMixin {
  ToolsDao(AppDatabase db) : super(db);

  Future<int> insertTool(Tool tool) {
    return customInsert(
      """INSERT INTO tools (
         name,
         bought_at,
         purchased_price,
         rate,
         rent_count,
         currency,
         category,
         tool_image_path,
         tool_unique_id,
         tool_user_id,
         status
        )
        VALUES (
          :name,
          :boughtAt,
          :purchasedPrice,
          :rate,
          :rentCount,
          :currency,
          :category,
          :toolImagePath,
          :toolUniqueId,
          :toolUserId,
          :status
        )
      """,
      variables: [
        Variable.withString(tool.name),
        Variable.withInt(tool.boughtAt.millisecondsSinceEpoch), // since boughtAt is a DateTime type, convert it to its int type for storage.
        Variable.withInt(tool.purchasedPrice),
        Variable.withInt(tool.rate),
        Variable.withInt(tool.rentCount),
        Variable.withString(tool.currency.name), // since currency is a enum type, convert it to its corresponding to String type for storage.
        Variable.withString(tool.category.name), // since category is a enum type, convert it to its corresponding to String type for storage.
        Variable.withString(tool.toolImagePath),
        Variable.withInt(tool.toolUniqueId),
        Variable(tool.toolUserId), // [toolUserId] is null for any new [Tool] to be inserted
        Variable.withString(tool.status.name), // since status is a enum type, convert it to its corresponding to String type for storage.
      ],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  // this kind of update is not optimized because it end up updating columns of a particular row that don't need updating.
  Future<int> updateTool(Tool tool) {
    return customUpdate(
      """UPDATE tools 
      SET 
        name = :name,
        bought_at = :boughtAt,
        purchased_price = :purchasedPrice,
        rate = :rate,
        rent_count = :rentCount,
        currency = :currency,
        category = :category,
        tool_image_path = :toolImagePath,
        tool_unique_id = :toolUniqueId,
        tool_user_id = :toolUserId,
        status = :status
      WHERE
        tool_id = :toolId
      """,
      variables: [
        Variable.withString(tool.name),
        Variable.withInt(tool.boughtAt.millisecondsSinceEpoch),
        Variable.withInt(tool.purchasedPrice),
        Variable.withInt(tool.rate),
        Variable.withInt(tool.rentCount),
        Variable.withString(tool.currency.name),
        Variable.withString(tool.category.name),
        Variable.withString(tool.toolImagePath),
        Variable.withInt(tool.toolUniqueId),
        Variable(tool.toolUserId),
        Variable.withString(tool.status.name),
        Variable(tool.toolId),
      ],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<int> deleteToolById(int toolId) {
    return customUpdate(
      'DELETE FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<int> deleteAllTools() {
    return customUpdate(
      'DELETE FROM tools',
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<Tool?> getToolByIdOrNull(int toolId) async {
    final toolResult = await customSelect(
      'SELECT * FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a tool) for the given toolId, or null if there is no row(tool) for the given toolId.
        .catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });

    // toolResult might be null if their isn't any tool for the give toolId,
    // just return null in that situation.
    if (toolResult == null) {
      return null;
    } else {
      return Tool.fromMap(toolMap: toolResult.data);
    }
  }

  Future<List<Tool>?> getToolsByStatusOrNull(Status status) async {
    final toolResults = await customSelect(
      'SELECT * FROM tools WHERE status = :status',
    ).get().catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });

    //toolResults might be an empty list if there isn't any tools for the given status
    if (toolResults.isEmpty) {
      return null;
    } else {
      List<Tool> tools = toolResults.map((queryRow) => Tool.fromMap(toolMap: queryRow.data)).toList();
      return tools;
    }
  }

  Future<List<Tool>?> getAllToolsOrNull() async {
    final toolResults = await customSelect(
      'SELECT * FROM tools',
    ).get().catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });

    // the toolResults can contain a list queryRows(representing tools) or empty list,
    // the toolResults might be empty because the tools table might not contain any tool rows.
    if (toolResults.isEmpty) {
      return null;
    } else {
      List<Tool> tools = toolResults.map((queryRow) => Tool.fromMap(toolMap: queryRow.data)).toList();

      return tools;
    }
  }
}
