import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'ppcam_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(fieldRename: FieldRename.snake)
class PpcamModel {
  PpcamModel(
    this.userId,
    this.id,
    this.serialNum,
    this.ipAddress,
  );

  int userId;
  int id;
  String serialNum;
  String ipAddress;

  @override
  String toString() {
    return 'JSON-PpcamModel: id: $id, userId: $userId, serialNum: $serialNum, ipAddress: $ipAddress';
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory PpcamModel.fromJson(Map<String, dynamic> json) =>
      _$PpcamModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PpcamModelToJson(this);
}
