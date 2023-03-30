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
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the DiscountCode type in your schema. */
@immutable
class DiscountCode extends Model {
  static const classType = const _DiscountCodeModelType();
  final String id;
  final String? _code;
  final int? _maxUse;
  final int? _actualUse;
  final TemporalDateTime? _validUntil;
  final double? _discount;
  final Event? _event;
  final User? _user;
  final List<Ticket>? _tickets;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get code {
    try {
      return _code!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime get validUntil {
    try {
      return _validUntil!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get discount {
    try {
      return _discount!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Event? get event {
    return _event;
  }
  
  User? get user {
    return _user;
  }
  
  List<Ticket>? get tickets {
    return _tickets;
  }
  
  TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime get updatedAt {
    try {
      return _updatedAt!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const DiscountCode._internal({required this.id, required code, maxUse, required actualUse, required validUntil, required discount, event, user, tickets, required createdAt, required updatedAt}): _code = code, _maxUse = maxUse, _actualUse = actualUse, _validUntil = validUntil, _discount = discount, _event = event, _user = user, _tickets = tickets, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DiscountCode({String? id, required String code, int? maxUse, required int actualUse, required TemporalDateTime validUntil, required double discount, Event? event, User? user, List<Ticket>? tickets, required TemporalDateTime createdAt, required TemporalDateTime updatedAt}) {
    return DiscountCode._internal(
      id: id == null ? UUID.getUUID() : id,
      code: code,
      maxUse: maxUse,
      actualUse: actualUse,
      validUntil: validUntil,
      discount: discount,
      event: event,
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
      _event == other._event &&
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
    buffer.write("event=" + (_event != null ? _event!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DiscountCode copyWith({String? id, String? code, int? maxUse, int? actualUse, TemporalDateTime? validUntil, double? discount, Event? event, User? user, List<Ticket>? tickets, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return DiscountCode._internal(
      id: id ?? this.id,
      code: code ?? this.code,
      maxUse: maxUse ?? this.maxUse,
      actualUse: actualUse ?? this.actualUse,
      validUntil: validUntil ?? this.validUntil,
      discount: discount ?? this.discount,
      event: event ?? this.event,
      user: user ?? this.user,
      tickets: tickets ?? this.tickets,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  DiscountCode.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _code = json['code'],
      _maxUse = (json['maxUse'] as num?)?.toInt(),
      _actualUse = (json['actualUse'] as num?)?.toInt(),
      _validUntil = json['validUntil'] != null ? TemporalDateTime.fromString(json['validUntil']) : null,
      _discount = (json['discount'] as num?)?.toDouble(),
      _event = json['event']?['serializedData'] != null
        ? Event.fromJson(new Map<String, dynamic>.from(json['event']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _tickets = json['tickets'] is List
        ? (json['tickets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Ticket.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'code': _code, 'maxUse': _maxUse, 'actualUse': _actualUse, 'validUntil': _validUntil?.format(), 'discount': _discount, 'event': _event?.toJson(), 'user': _user?.toJson(), 'tickets': _tickets?.map((Ticket? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'code': _code, 'maxUse': _maxUse, 'actualUse': _actualUse, 'validUntil': _validUntil, 'discount': _discount, 'event': _event, 'user': _user, 'tickets': _tickets, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CODE = QueryField(fieldName: "code");
  static final QueryField MAXUSE = QueryField(fieldName: "maxUse");
  static final QueryField ACTUALUSE = QueryField(fieldName: "actualUse");
  static final QueryField VALIDUNTIL = QueryField(fieldName: "validUntil");
  static final QueryField DISCOUNT = QueryField(fieldName: "discount");
  static final QueryField EVENT = QueryField(
    fieldName: "event",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField TICKETS = QueryField(
    fieldName: "tickets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DiscountCode";
    modelSchemaDefinition.pluralName = "DiscountCodes";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Admin" ],
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["code", "eventID"], name: null),
      ModelIndex(fields: const ["eventID"], name: "byEvent"),
      ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.CODE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.MAXUSE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.ACTUALUSE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.VALIDUNTIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.DISCOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: DiscountCode.EVENT,
      isRequired: false,
      targetName: 'eventID',
      ofModelName: 'Event'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: DiscountCode.USER,
      isRequired: false,
      targetName: 'userID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: DiscountCode.TICKETS,
      isRequired: false,
      ofModelName: 'Ticket',
      associatedKey: Ticket.DISCOUNTCODE
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DiscountCode.UPDATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DiscountCodeModelType extends ModelType<DiscountCode> {
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