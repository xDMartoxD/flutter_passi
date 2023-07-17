/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the DiscountCode type in your schema. */
class DiscountCode extends amplify_core.Model {
  static const classType = const _DiscountCodeModelType();
  final String id;
  final String? _code;
  final int? _maxUse;
  final int? _actualUse;
  final amplify_core.TemporalDateTime? _validUntil;
  final double? _discount;
  final String? _eventID;
  final User? _user;
  final List<Ticket>? _tickets;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  DiscountCodeModelIdentifier get modelIdentifier {
    try {
      return DiscountCodeModelIdentifier(
        code: _code!,
        eventID: _eventID!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get code {
    try {
      return _code!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get maxUse {
    return _maxUse;
  }
  
  int get actualUse {
    try {
      return _actualUse!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get validUntil {
    try {
      return _validUntil!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get discount {
    try {
      return _discount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get eventID {
    try {
      return _eventID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get user {
    return _user;
  }
  
  List<Ticket>? get tickets {
    return _tickets;
  }
  
  amplify_core.TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get updatedAt {
    try {
      return _updatedAt!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const DiscountCode._internal({required this.id, required code, maxUse, required actualUse, required validUntil, required discount, required eventID, user, tickets, required createdAt, required updatedAt}): _code = code, _maxUse = maxUse, _actualUse = actualUse, _validUntil = validUntil, _discount = discount, _eventID = eventID, _user = user, _tickets = tickets, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DiscountCode({String? id, required String code, int? maxUse, required int actualUse, required amplify_core.TemporalDateTime validUntil, required double discount, required String eventID, User? user, List<Ticket>? tickets, required amplify_core.TemporalDateTime createdAt, required amplify_core.TemporalDateTime updatedAt}) {
    return DiscountCode._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      code: code,
      maxUse: maxUse,
      actualUse: actualUse,
      validUntil: validUntil,
      discount: discount,
      eventID: eventID,
      user: user,
      tickets: tickets != null ? List<Ticket>.unmodifiable(tickets) : tickets,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiscountCode &&
      id == other.id &&
      _code == other._code &&
      _maxUse == other._maxUse &&
      _actualUse == other._actualUse &&
      _validUntil == other._validUntil &&
      _discount == other._discount &&
      _eventID == other._eventID &&
      _user == other._user &&
      DeepCollectionEquality().equals(_tickets, other._tickets) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DiscountCode {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("code=" + "$_code" + ", ");
    buffer.write("maxUse=" + (_maxUse != null ? _maxUse!.toString() : "null") + ", ");
    buffer.write("actualUse=" + (_actualUse != null ? _actualUse!.toString() : "null") + ", ");
    buffer.write("validUntil=" + (_validUntil != null ? _validUntil!.format() : "null") + ", ");
    buffer.write("discount=" + (_discount != null ? _discount!.toString() : "null") + ", ");
    buffer.write("eventID=" + "$_eventID" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DiscountCode copyWith({String? id, int? maxUse, int? actualUse, amplify_core.TemporalDateTime? validUntil, double? discount, User? user, List<Ticket>? tickets, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return DiscountCode._internal(
      id: id ?? this.id,
      code: code,
      maxUse: maxUse ?? this.maxUse,
      actualUse: actualUse ?? this.actualUse,
      validUntil: validUntil ?? this.validUntil,
      discount: discount ?? this.discount,
      eventID: eventID,
      user: user ?? this.user,
      tickets: tickets ?? this.tickets,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  DiscountCode copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<int?>? maxUse,
    ModelFieldValue<int>? actualUse,
    ModelFieldValue<amplify_core.TemporalDateTime>? validUntil,
    ModelFieldValue<double>? discount,
    ModelFieldValue<User?>? user,
    ModelFieldValue<List<Ticket>?>? tickets,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime>? updatedAt
  }) {
    return DiscountCode._internal(
      id: id == null ? this.id : id.value,
      code: code,
      maxUse: maxUse == null ? this.maxUse : maxUse.value,
      actualUse: actualUse == null ? this.actualUse : actualUse.value,
      validUntil: validUntil == null ? this.validUntil : validUntil.value,
      discount: discount == null ? this.discount : discount.value,
      eventID: eventID,
      user: user == null ? this.user : user.value,
      tickets: tickets == null ? this.tickets : tickets.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  DiscountCode.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _code = json['code'],
      _maxUse = (json['maxUse'] as num?)?.toInt(),
      _actualUse = (json['actualUse'] as num?)?.toInt(),
      _validUntil = json['validUntil'] != null ? amplify_core.TemporalDateTime.fromString(json['validUntil']) : null,
      _discount = (json['discount'] as num?)?.toDouble(),
      _eventID = json['eventID'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _tickets = json['tickets'] is List
        ? (json['tickets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Ticket.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'code': _code, 'maxUse': _maxUse, 'actualUse': _actualUse, 'validUntil': _validUntil?.format(), 'discount': _discount, 'eventID': _eventID, 'user': _user?.toJson(), 'tickets': _tickets?.map((Ticket? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'code': _code,
    'maxUse': _maxUse,
    'actualUse': _actualUse,
    'validUntil': _validUntil,
    'discount': _discount,
    'eventID': _eventID,
    'user': _user,
    'tickets': _tickets,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DiscountCodeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DiscountCodeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CODE = amplify_core.QueryField(fieldName: "code");
  static final MAXUSE = amplify_core.QueryField(fieldName: "maxUse");
  static final ACTUALUSE = amplify_core.QueryField(fieldName: "actualUse");
  static final VALIDUNTIL = amplify_core.QueryField(fieldName: "validUntil");
  static final DISCOUNT = amplify_core.QueryField(fieldName: "discount");
  static final EVENTID = amplify_core.QueryField(fieldName: "eventID");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final TICKETS = amplify_core.QueryField(
    fieldName: "tickets",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DiscountCode";
    modelSchemaDefinition.pluralName = "DiscountCodes";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Admin" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["code", "eventID"], name: null),
      amplify_core.ModelIndex(fields: const ["eventID"], name: "byEvent"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.CODE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.MAXUSE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.ACTUALUSE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.VALIDUNTIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.DISCOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.EVENTID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: DiscountCode.USER,
      isRequired: false,
      targetNames: ['userID'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: DiscountCode.TICKETS,
      isRequired: false,
      ofModelName: 'Ticket',
      associatedKey: Ticket.DISCOUNTCODE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.CREATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: DiscountCode.UPDATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DiscountCodeModelType extends amplify_core.ModelType<DiscountCode> {
  const _DiscountCodeModelType();
  
  @override
  DiscountCode fromJson(Map<String, dynamic> jsonData) {
    return DiscountCode.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'DiscountCode';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [DiscountCode] in your schema.
 */
class DiscountCodeModelIdentifier implements amplify_core.ModelIdentifier<DiscountCode> {
  final String code;
  final String eventID;

  /**
   * Create an instance of DiscountCodeModelIdentifier using [code] the primary key.
   * And [eventID] the sort key.
   */
  const DiscountCodeModelIdentifier({
    required this.code,
    required this.eventID});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'code': code,
    'eventID': eventID
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'DiscountCodeModelIdentifier(code: $code, eventID: $eventID)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DiscountCodeModelIdentifier &&
      code == other.code &&
      eventID == other.eventID;
  }
  
  @override
  int get hashCode =>
    code.hashCode ^
    eventID.hashCode;
}