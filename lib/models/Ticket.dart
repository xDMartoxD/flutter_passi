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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Ticket type in your schema. */
@immutable
class Ticket extends Model {
  static const classType = const _TicketModelType();
  final String id;
  final Event? _Event;
  final TicketCategory? _TicketCategory;
  final TemporalDateTime? _inDateTime;
  final TemporalDateTime? _outDateTime;
  final bool? _didAssist;
  final User? _User;
  final Job? _registeredBy;
  final DiscountCode? _discountCode;
  final Transaction? _transaction;
  final String? _seat;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Event get Event {
    try {
      return _Event!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TicketCategory? get TicketCategory {
    return _TicketCategory;
  }
  
  TemporalDateTime? get inDateTime {
    return _inDateTime;
  }
  
  TemporalDateTime? get outDateTime {
    return _outDateTime;
  }
  
  bool get didAssist {
    try {
      return _didAssist!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User get User {
    try {
      return _User!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Job? get registeredBy {
    return _registeredBy;
  }
  
  DiscountCode? get discountCode {
    return _discountCode;
  }
  
  Transaction? get transaction {
    return _transaction;
  }
  
  String? get seat {
    return _seat;
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
  
  const Ticket._internal({required this.id, required Event, TicketCategory, inDateTime, outDateTime, required didAssist, required User, registeredBy, discountCode, transaction, seat, required createdAt, required updatedAt}): _Event = Event, _TicketCategory = TicketCategory, _inDateTime = inDateTime, _outDateTime = outDateTime, _didAssist = didAssist, _User = User, _registeredBy = registeredBy, _discountCode = discountCode, _transaction = transaction, _seat = seat, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Ticket({String? id, required Event Event, TicketCategory? TicketCategory, TemporalDateTime? inDateTime, TemporalDateTime? outDateTime, required bool didAssist, required User User, Job? registeredBy, DiscountCode? discountCode, Transaction? transaction, String? seat, required TemporalDateTime createdAt, required TemporalDateTime updatedAt}) {
    return Ticket._internal(
      id: id == null ? UUID.getUUID() : id,
      Event: Event,
      TicketCategory: TicketCategory,
      inDateTime: inDateTime,
      outDateTime: outDateTime,
      didAssist: didAssist,
      User: User,
      registeredBy: registeredBy,
      discountCode: discountCode,
      transaction: transaction,
      seat: seat,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ticket &&
      id == other.id &&
      _Event == other._Event &&
      _TicketCategory == other._TicketCategory &&
      _inDateTime == other._inDateTime &&
      _outDateTime == other._outDateTime &&
      _didAssist == other._didAssist &&
      _User == other._User &&
      _registeredBy == other._registeredBy &&
      _discountCode == other._discountCode &&
      _transaction == other._transaction &&
      _seat == other._seat &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Ticket {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Event=" + (_Event != null ? _Event!.toString() : "null") + ", ");
    buffer.write("TicketCategory=" + (_TicketCategory != null ? _TicketCategory!.toString() : "null") + ", ");
    buffer.write("inDateTime=" + (_inDateTime != null ? _inDateTime!.format() : "null") + ", ");
    buffer.write("outDateTime=" + (_outDateTime != null ? _outDateTime!.format() : "null") + ", ");
    buffer.write("didAssist=" + (_didAssist != null ? _didAssist!.toString() : "null") + ", ");
    buffer.write("User=" + (_User != null ? _User!.toString() : "null") + ", ");
    buffer.write("registeredBy=" + (_registeredBy != null ? _registeredBy!.toString() : "null") + ", ");
    buffer.write("discountCode=" + (_discountCode != null ? _discountCode!.toString() : "null") + ", ");
    buffer.write("transaction=" + (_transaction != null ? _transaction!.toString() : "null") + ", ");
    buffer.write("seat=" + "$_seat" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Ticket copyWith({String? id, Event? Event, TicketCategory? TicketCategory, TemporalDateTime? inDateTime, TemporalDateTime? outDateTime, bool? didAssist, User? User, Job? registeredBy, DiscountCode? discountCode, Transaction? transaction, String? seat, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Ticket._internal(
      id: id ?? this.id,
      Event: Event ?? this.Event,
      TicketCategory: TicketCategory ?? this.TicketCategory,
      inDateTime: inDateTime ?? this.inDateTime,
      outDateTime: outDateTime ?? this.outDateTime,
      didAssist: didAssist ?? this.didAssist,
      User: User ?? this.User,
      registeredBy: registeredBy ?? this.registeredBy,
      discountCode: discountCode ?? this.discountCode,
      transaction: transaction ?? this.transaction,
      seat: seat ?? this.seat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Ticket.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Event = json['Event']?['serializedData'] != null
        ? Event.fromJson(new Map<String, dynamic>.from(json['Event']['serializedData']))
        : null,
      _TicketCategory = json['TicketCategory']?['serializedData'] != null
        ? TicketCategory.fromJson(new Map<String, dynamic>.from(json['TicketCategory']['serializedData']))
        : null,
      _inDateTime = json['inDateTime'] != null ? TemporalDateTime.fromString(json['inDateTime']) : null,
      _outDateTime = json['outDateTime'] != null ? TemporalDateTime.fromString(json['outDateTime']) : null,
      _didAssist = json['didAssist'],
      _User = json['User']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['User']['serializedData']))
        : null,
      _registeredBy = json['registeredBy']?['serializedData'] != null
        ? Job.fromJson(new Map<String, dynamic>.from(json['registeredBy']['serializedData']))
        : null,
      _discountCode = json['discountCode']?['serializedData'] != null
        ? DiscountCode.fromJson(new Map<String, dynamic>.from(json['discountCode']['serializedData']))
        : null,
      _transaction = json['transaction']?['serializedData'] != null
        ? Transaction.fromJson(new Map<String, dynamic>.from(json['transaction']['serializedData']))
        : null,
      _seat = json['seat'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Event': _Event?.toJson(), 'TicketCategory': _TicketCategory?.toJson(), 'inDateTime': _inDateTime?.format(), 'outDateTime': _outDateTime?.format(), 'didAssist': _didAssist, 'User': _User?.toJson(), 'registeredBy': _registeredBy?.toJson(), 'discountCode': _discountCode?.toJson(), 'transaction': _transaction?.toJson(), 'seat': _seat, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'Event': _Event, 'TicketCategory': _TicketCategory, 'inDateTime': _inDateTime, 'outDateTime': _outDateTime, 'didAssist': _didAssist, 'User': _User, 'registeredBy': _registeredBy, 'discountCode': _discountCode, 'transaction': _transaction, 'seat': _seat, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EVENT = QueryField(
    fieldName: "Event",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final QueryField TICKETCATEGORY = QueryField(
    fieldName: "TicketCategory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'TicketCategory'));
  static final QueryField INDATETIME = QueryField(fieldName: "inDateTime");
  static final QueryField OUTDATETIME = QueryField(fieldName: "outDateTime");
  static final QueryField DIDASSIST = QueryField(fieldName: "didAssist");
  static final QueryField USER = QueryField(
    fieldName: "User",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField REGISTEREDBY = QueryField(
    fieldName: "registeredBy",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Job'));
  static final QueryField DISCOUNTCODE = QueryField(
    fieldName: "discountCode",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'DiscountCode'));
  static final QueryField TRANSACTION = QueryField(fieldName: "transaction");
  static final QueryField SEAT = QueryField(fieldName: "seat");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Ticket";
    modelSchemaDefinition.pluralName = "Tickets";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "userID",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.READ
        ]),
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
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["id"], name: null),
      ModelIndex(fields: const ["eventID"], name: "byEvent"),
      ModelIndex(fields: const ["ticketCategoryID"], name: "byTicketCategory"),
      ModelIndex(fields: const ["userID"], name: "byUser"),
      ModelIndex(fields: const ["jobID"], name: "byJob"),
      ModelIndex(fields: const ["code", "eventID"], name: "byDiscountCode")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Ticket.EVENT,
      isRequired: true,
      targetName: 'eventID',
      ofModelName: 'Event'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Ticket.TICKETCATEGORY,
      isRequired: false,
      targetName: 'ticketCategoryID',
      ofModelName: 'TicketCategory'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ticket.INDATETIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ticket.OUTDATETIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ticket.DIDASSIST,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Ticket.USER,
      isRequired: true,
      targetName: 'userID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Ticket.REGISTEREDBY,
      isRequired: false,
      targetName: 'jobID',
      ofModelName: 'Job'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Ticket.DISCOUNTCODE,
      isRequired: false,
      targetName: 'code',
      ofModelName: 'DiscountCode'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'transaction',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Transaction')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ticket.SEAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ticket.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Ticket.UPDATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TicketModelType extends ModelType<Ticket> {
  const _TicketModelType();
  
  @override
  Ticket fromJson(Map<String, dynamic> jsonData) {
    return Ticket.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Ticket';
  }
}