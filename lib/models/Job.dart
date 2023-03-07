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


/** This is an auto generated class representing the Job type in your schema. */
@immutable
class Job extends Model {
  static const classType = const _JobModelType();
  final String id;
  final List<Ticket>? _registeredTickets;
  final List<JobTypeEnum>? _type;
  final String? _phoneNumber;
  final Event? _event;
  final User? _user;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  JobModelIdentifier get modelIdentifier {
      return JobModelIdentifier(
        id: id
      );
  }
  
  List<Ticket>? get registeredTickets {
    return _registeredTickets;
  }
  
  List<JobTypeEnum>? get type {
    return _type;
  }
  
  String? get phoneNumber {
    return _phoneNumber;
  }
  
  Event get event {
    try {
      return _event!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  const Job._internal({required this.id, registeredTickets, type, phoneNumber, required event, required user, required createdAt, required updatedAt}): _registeredTickets = registeredTickets, _type = type, _phoneNumber = phoneNumber, _event = event, _user = user, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Job({String? id, List<Ticket>? registeredTickets, List<JobTypeEnum>? type, String? phoneNumber, required Event event, required User user, required TemporalDateTime createdAt, required TemporalDateTime updatedAt}) {
    return Job._internal(
      id: id == null ? UUID.getUUID() : id,
      registeredTickets: registeredTickets != null ? List<Ticket>.unmodifiable(registeredTickets) : registeredTickets,
      type: type != null ? List<JobTypeEnum>.unmodifiable(type) : type,
      phoneNumber: phoneNumber,
      event: event,
      user: user,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Job &&
      id == other.id &&
      DeepCollectionEquality().equals(_registeredTickets, other._registeredTickets) &&
      DeepCollectionEquality().equals(_type, other._type) &&
      _phoneNumber == other._phoneNumber &&
      _event == other._event &&
      _user == other._user &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Job {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("type=" + (_type != null ? _type!.map((e) => enumToString(e)).toString() : "null") + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("event=" + (_event != null ? _event!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Job copyWith({List<Ticket>? registeredTickets, List<JobTypeEnum>? type, String? phoneNumber, Event? event, User? user, TemporalDateTime? createdAt, TemporalDateTime? updatedAt}) {
    return Job._internal(
      id: id,
      registeredTickets: registeredTickets ?? this.registeredTickets,
      type: type ?? this.type,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      event: event ?? this.event,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Job.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _registeredTickets = json['registeredTickets'] is List
        ? (json['registeredTickets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Ticket.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _type = json['type'] is List
        ? (json['type'] as List)
          .map((e) => enumFromString<JobTypeEnum>(e, JobTypeEnum.values)!)
          .toList()
        : null,
      _phoneNumber = json['phoneNumber'],
      _event = json['event']?['serializedData'] != null
        ? Event.fromJson(new Map<String, dynamic>.from(json['event']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'registeredTickets': _registeredTickets?.map((Ticket? e) => e?.toJson()).toList(), 'type': _type?.map((e) => enumToString(e)).toList(), 'phoneNumber': _phoneNumber, 'event': _event?.toJson(), 'user': _user?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'registeredTickets': _registeredTickets, 'type': _type, 'phoneNumber': _phoneNumber, 'event': _event, 'user': _user, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<JobModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<JobModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField REGISTEREDTICKETS = QueryField(
    fieldName: "registeredTickets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField EVENT = QueryField(
    fieldName: "event",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Job";
    modelSchemaDefinition.pluralName = "Jobs";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
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
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["id"], name: null),
      ModelIndex(fields: const ["eventID"], name: "byEvent"),
      ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Job.REGISTEREDTICKETS,
      isRequired: true,
      ofModelName: 'Ticket',
      associatedKey: Ticket.REGISTEREDBY
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Job.TYPE,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.enumeration))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Job.PHONENUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Job.EVENT,
      isRequired: true,
      targetNames: ['eventID'],
      ofModelName: 'Event'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Job.USER,
      isRequired: true,
      targetNames: ['userID'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Job.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Job.UPDATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _JobModelType extends ModelType<Job> {
  const _JobModelType();
  
  @override
  Job fromJson(Map<String, dynamic> jsonData) {
    return Job.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Job';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Job] in your schema.
 */
@immutable
class JobModelIdentifier implements ModelIdentifier<Job> {
  final String id;

  /** Create an instance of JobModelIdentifier using [id] the primary key. */
  const JobModelIdentifier({
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
  String toString() => 'JobModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is JobModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}