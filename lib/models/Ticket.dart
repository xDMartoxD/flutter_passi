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


/** This is an auto generated class representing the Ticket type in your schema. */
class Ticket extends amplify_core.Model {
  static const classType = const _TicketModelType();
  final String id;
  final Event? _event;
  final TicketCategory? _ticketCategory;
  final amplify_core.TemporalDateTime? _inDateTime;
  final amplify_core.TemporalDateTime? _outDateTime;
  final bool? _didAssist;
  final User? _user;
  final Job? _registeredBy;
  final DiscountCode? _discountCode;
  final Transaction? _transaction;
  final String? _seat;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TicketModelIdentifier get modelIdentifier {
      return TicketModelIdentifier(
        id: id
      );
  }
  
  Event? get event {
    return _event;
  }
  
  TicketCategory? get ticketCategory {
    return _ticketCategory;
  }
  
  amplify_core.TemporalDateTime? get inDateTime {
    return _inDateTime;
  }
  
  amplify_core.TemporalDateTime? get outDateTime {
    return _outDateTime;
  }
  
  bool get didAssist {
    try {
      return _didAssist!;
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
  
  const Ticket._internal({required this.id, event, ticketCategory, inDateTime, outDateTime, required didAssist, user, registeredBy, discountCode, transaction, seat, required createdAt, required updatedAt}): _event = event, _ticketCategory = ticketCategory, _inDateTime = inDateTime, _outDateTime = outDateTime, _didAssist = didAssist, _user = user, _registeredBy = registeredBy, _discountCode = discountCode, _transaction = transaction, _seat = seat, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Ticket({String? id, Event? event, TicketCategory? ticketCategory, amplify_core.TemporalDateTime? inDateTime, amplify_core.TemporalDateTime? outDateTime, required bool didAssist, User? user, Job? registeredBy, DiscountCode? discountCode, Transaction? transaction, String? seat, required amplify_core.TemporalDateTime createdAt, required amplify_core.TemporalDateTime updatedAt}) {
    return Ticket._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      event: event,
      ticketCategory: ticketCategory,
      inDateTime: inDateTime,
      outDateTime: outDateTime,
      didAssist: didAssist,
      user: user,
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
      _event == other._event &&
      _ticketCategory == other._ticketCategory &&
      _inDateTime == other._inDateTime &&
      _outDateTime == other._outDateTime &&
      _didAssist == other._didAssist &&
      _user == other._user &&
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
    buffer.write("event=" + (_event != null ? _event!.toString() : "null") + ", ");
    buffer.write("ticketCategory=" + (_ticketCategory != null ? _ticketCategory!.toString() : "null") + ", ");
    buffer.write("inDateTime=" + (_inDateTime != null ? _inDateTime!.format() : "null") + ", ");
    buffer.write("outDateTime=" + (_outDateTime != null ? _outDateTime!.format() : "null") + ", ");
    buffer.write("didAssist=" + (_didAssist != null ? _didAssist!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("registeredBy=" + (_registeredBy != null ? _registeredBy!.toString() : "null") + ", ");
    buffer.write("discountCode=" + (_discountCode != null ? _discountCode!.toString() : "null") + ", ");
    buffer.write("transaction=" + (_transaction != null ? _transaction!.toString() : "null") + ", ");
    buffer.write("seat=" + "$_seat" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Ticket copyWith({Event? event, TicketCategory? ticketCategory, amplify_core.TemporalDateTime? inDateTime, amplify_core.TemporalDateTime? outDateTime, bool? didAssist, User? user, Job? registeredBy, DiscountCode? discountCode, Transaction? transaction, String? seat, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return Ticket._internal(
      id: id,
      event: event ?? this.event,
      ticketCategory: ticketCategory ?? this.ticketCategory,
      inDateTime: inDateTime ?? this.inDateTime,
      outDateTime: outDateTime ?? this.outDateTime,
      didAssist: didAssist ?? this.didAssist,
      user: user ?? this.user,
      registeredBy: registeredBy ?? this.registeredBy,
      discountCode: discountCode ?? this.discountCode,
      transaction: transaction ?? this.transaction,
      seat: seat ?? this.seat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Ticket copyWithModelFieldValues({
    ModelFieldValue<Event?>? event,
    ModelFieldValue<TicketCategory?>? ticketCategory,
    ModelFieldValue<amplify_core.TemporalDateTime?>? inDateTime,
    ModelFieldValue<amplify_core.TemporalDateTime?>? outDateTime,
    ModelFieldValue<bool>? didAssist,
    ModelFieldValue<User?>? user,
    ModelFieldValue<Job?>? registeredBy,
    ModelFieldValue<DiscountCode?>? discountCode,
    ModelFieldValue<Transaction?>? transaction,
    ModelFieldValue<String?>? seat,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime>? updatedAt
  }) {
    return Ticket._internal(
      id: id,
      event: event == null ? this.event : event.value,
      ticketCategory: ticketCategory == null ? this.ticketCategory : ticketCategory.value,
      inDateTime: inDateTime == null ? this.inDateTime : inDateTime.value,
      outDateTime: outDateTime == null ? this.outDateTime : outDateTime.value,
      didAssist: didAssist == null ? this.didAssist : didAssist.value,
      user: user == null ? this.user : user.value,
      registeredBy: registeredBy == null ? this.registeredBy : registeredBy.value,
      discountCode: discountCode == null ? this.discountCode : discountCode.value,
      transaction: transaction == null ? this.transaction : transaction.value,
      seat: seat == null ? this.seat : seat.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  Ticket.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _event = json['event']?['serializedData'] != null
        ? Event.fromJson(new Map<String, dynamic>.from(json['event']['serializedData']))
        : null,
      _ticketCategory = json['ticketCategory']?['serializedData'] != null
        ? TicketCategory.fromJson(new Map<String, dynamic>.from(json['ticketCategory']['serializedData']))
        : null,
      _inDateTime = json['inDateTime'] != null ? amplify_core.TemporalDateTime.fromString(json['inDateTime']) : null,
      _outDateTime = json['outDateTime'] != null ? amplify_core.TemporalDateTime.fromString(json['outDateTime']) : null,
      _didAssist = json['didAssist'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
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
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'event': _event?.toJson(), 'ticketCategory': _ticketCategory?.toJson(), 'inDateTime': _inDateTime?.format(), 'outDateTime': _outDateTime?.format(), 'didAssist': _didAssist, 'user': _user?.toJson(), 'registeredBy': _registeredBy?.toJson(), 'discountCode': _discountCode?.toJson(), 'transaction': _transaction?.toJson(), 'seat': _seat, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'event': _event,
    'ticketCategory': _ticketCategory,
    'inDateTime': _inDateTime,
    'outDateTime': _outDateTime,
    'didAssist': _didAssist,
    'user': _user,
    'registeredBy': _registeredBy,
    'discountCode': _discountCode,
    'transaction': _transaction,
    'seat': _seat,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TicketModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TicketModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EVENT = amplify_core.QueryField(
    fieldName: "event",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final TICKETCATEGORY = amplify_core.QueryField(
    fieldName: "ticketCategory",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'TicketCategory'));
  static final INDATETIME = amplify_core.QueryField(fieldName: "inDateTime");
  static final OUTDATETIME = amplify_core.QueryField(fieldName: "outDateTime");
  static final DIDASSIST = amplify_core.QueryField(fieldName: "didAssist");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final REGISTEREDBY = amplify_core.QueryField(
    fieldName: "registeredBy",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Job'));
  static final DISCOUNTCODE = amplify_core.QueryField(
    fieldName: "discountCode",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'DiscountCode'));
  static final TRANSACTION = amplify_core.QueryField(fieldName: "transaction");
  static final SEAT = amplify_core.QueryField(fieldName: "seat");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Ticket";
    modelSchemaDefinition.pluralName = "Tickets";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "userID",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
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
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null),
      amplify_core.ModelIndex(fields: const ["eventID"], name: "byEvent"),
      amplify_core.ModelIndex(fields: const ["ticketCategoryID"], name: "byTicketCategory"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser"),
      amplify_core.ModelIndex(fields: const ["jobID"], name: "byJob"),
      amplify_core.ModelIndex(fields: const ["code", "eventID"], name: "byDiscountCode")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ticket.EVENT,
      isRequired: false,
      targetNames: ['eventID'],
      ofModelName: 'Event'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ticket.TICKETCATEGORY,
      isRequired: false,
      targetNames: ['ticketCategoryID'],
      ofModelName: 'TicketCategory'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ticket.INDATETIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ticket.OUTDATETIME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ticket.DIDASSIST,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ticket.USER,
      isRequired: false,
      targetNames: ['userID'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ticket.REGISTEREDBY,
      isRequired: false,
      targetNames: ['jobID'],
      ofModelName: 'Job'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ticket.DISCOUNTCODE,
      isRequired: false,
      targetNames: ['code', 'eventID'],
      ofModelName: 'DiscountCode'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'transaction',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Transaction')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ticket.SEAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ticket.CREATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ticket.UPDATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TicketModelType extends amplify_core.ModelType<Ticket> {
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

/**
 * This is an auto generated class representing the model identifier
 * of [Ticket] in your schema.
 */
class TicketModelIdentifier implements amplify_core.ModelIdentifier<Ticket> {
  final String id;

  /** Create an instance of TicketModelIdentifier using [id] the primary key. */
  const TicketModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TicketModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TicketModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}