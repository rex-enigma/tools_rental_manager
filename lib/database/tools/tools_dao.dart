import 'package:drift/drift.dart';
import 'package:tools_rental_management/data/models/tool_model.dart';
import 'package:tools_rental_management/database/app_database.dart';
import 'package:tools_rental_management/database/tools/tools_table.dart';
import 'package:tools_rental_management/enums/category.dart';
import 'package:tools_rental_management/enums/status.dart';

part 'tools_dao.g.dart';

@DriftAccessor(tables: [Tools])
class ToolsDao extends DatabaseAccessor<AppDatabase> with _$ToolsDaoMixin {
  ToolsDao(AppDatabase db) : super(db);

  Future<int> insertTool(ToolModel tool) {
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
  // but is useful if you will end up updating more than one value.
  Future<int> updateTool(ToolModel tool) {
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

  Future<int> updateToolName(String toolName, int toolId) {
    return customUpdate(
      """UPDATE tools 
      SET 
        name = :name
      WHERE
        tool_id = :toolId
      """,
      variables: [
        Variable.withString(toolName),
        Variable.withInt(toolId),
      ],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<int> updateToolStatus(Status toolStatus, int toolId) {
    return customUpdate(
      """UPDATE tools 
      SET 
        status = :status
      WHERE
        tool_id = :toolId
      """,
      variables: [
        Variable.withString(toolStatus.name),
        Variable.withInt(toolId),
      ],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<int> updateToolRate(int toolRate, int toolId) {
    return customUpdate(
      """UPDATE tools 
      SET 
        rate = :rate
      WHERE
        tool_id = :toolId
      """,
      variables: [
        Variable.withInt(toolRate),
        Variable.withInt(toolId),
      ],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<int> updateToolCategory(Category toolCategory, int toolId) {
    return customUpdate(
      """UPDATE tools 
      SET 
        category = :category
      WHERE
        tool_id = :toolId
      """,
      variables: [
        Variable.withString(toolCategory.name),
        Variable.withInt(toolId),
      ],
    ).catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
  }

  Future<int> updateToolImagePath(String toolImagePath, int toolId) {
    return customUpdate(
      """UPDATE tools 
      SET 
        tool_image_path = :toolImagePath
      WHERE
        tool_id = :toolId
      """,
      variables: [
        Variable.withString(toolImagePath),
        Variable.withInt(toolId),
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

  Future<ToolModel?> getToolByIdOrNull(int toolId) async {
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
      return ToolModel.fromMap(toolMap: toolResult.data);
    }
  }

  /// returns a future that completes with the tool name for the given toolId.
  Future<String?> getToolNameByIdOrNull(int toolId) async {
    final toolNameResult = await customSelect(
      'SELECT name FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a tool) for the given toolId, or null if there is no row(tool) for the given toolId.
        .catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
    // since we selected the name attribute then we expect the map returned will have [name] as key, and will allow as to
    // get the corresponding value which will be the name of the tool for the given toolId.
    return toolNameResult?.data['name'];
  }

  /// returns a future that completes with the tool status for the given toolId.
  Future<Status?> getToolStatusByIdOrNull(int toolId) async {
    final toolStatusResult = await customSelect(
      'SELECT status FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a tool) for the given toolId, or null if there is no row(tool) for the given toolId.
        .catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
    // since we selected the status attribute then we expect the map returned will have [status] as key, and will allow as to
    // get the corresponding value which will be the status(represented as string) of the tool for the given toolId.
    String status = toolStatusResult?.data['status'];
    return Status.fromString(status);
  }

  /// returns a future that completes with the tool rate for the given toolId.
  Future<int?> getToolRateByIdOrNull(int toolId) async {
    final toolRateResult = await customSelect(
      'SELECT rate FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a tool) for the given toolId, or null if there is no row(tool) for the given toolId.
        .catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
    // since we selected the rate attribute then we expect the map returned will have [rate] as key, and will allow as to
    // get the corresponding value which will be the rate for the tool for the given toolId.
    return toolRateResult?.data['rate'];
  }

  /// returns a future that completes with the tool category for the given toolId.
  Future<Category?> getToolCategoryByIdOrNull(int toolId) async {
    final toolCategoryResult = await customSelect(
      'SELECT category FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a tool) for the given toolId, or null if there is no row(tool) for the given toolId.
        .catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
    // since we selected the category attribute then we expect the map returned will have [category] as key, and will allow as to
    // get the corresponding value which will be the category(represented as string) for the tool for the given toolId.
    String category = toolCategoryResult?.data['category'];
    return Category.fromString(category);
  }

  /// returns a future that completes with the tool image paths for the given toolId.
  Future<String?> getToolImagePathByIdOrNull(int toolId) async {
    final toolImagePathResult = await customSelect(
      'SELECT tool_image_path FROM tools WHERE tool_id = :toolId',
      variables: [Variable.withInt(toolId)],
    )
        .getSingleOrNull() // return a future that will complete with a queryRow(representing a tool) for the given toolId, or null if there is no row(tool) for the given toolId.
        .catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });
    // since we selected the tool_image_path attribute then we expect the map returned will have [tool_image_path] as key, and will allow as to
    // get the corresponding value which will be the image path for the tool for the given toolId.
    return toolImagePathResult?.data['tool_image_path'];
  }

  // return a future that completes with a list of tools or null for the given status .
  Future<List<ToolModel>?> getToolsByStatusOrNull(Status status) async {
    final toolByStatusResults = await customSelect(
      'SELECT * FROM tools WHERE status = :status',
      variables: [Variable.withString(status.name)],
    ).get().catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stacktrace: $stacktrace');
      throw e;
    });

    //toolResults might be an empty list if there isn't any tools for the given status
    if (toolByStatusResults.isEmpty) {
      return null;
    } else {
      List<ToolModel> tools = toolByStatusResults.map((queryRow) => ToolModel.fromMap(toolMap: queryRow.data)).toList();
      return tools;
    }
  }

  Future<List<ToolModel>?> getToolsByToolUserIdOrNull(int toolUserId) async {
    final toolResults = await customSelect(
      'SELECT * FROM tools WHERE tool_user_id = :toolUserId',
      variables: [Variable.withInt(toolUserId)],
    ).get().catchError((Object e, StackTrace stacktrace) {
      print('Error: $e, stackTrace: $stacktrace');
      throw Exception(e);
    });

    if (toolResults.isEmpty) return null;

    // transform a list of 'tools queryRow' into a list of[ToolModel].
    List<ToolModel> tools = toolResults.map((queryRow) {
      final toolMap = queryRow.data;
      ToolModel tool = ToolModel.fromMap(toolMap: toolMap);
      return tool;
    }).toList();

    return tools;
  }

  Future<List<ToolModel>?> getAllToolsOrNull() async {
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
      List<ToolModel> tools = toolResults.map((queryRow) {
        return ToolModel.fromMap(toolMap: queryRow.data);
      }).toList();

      return tools;
    }
  }
}
