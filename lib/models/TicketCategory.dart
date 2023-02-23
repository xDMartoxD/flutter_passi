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


/** This is an auto generated class representing the TicketCategory type in your schema. */
@immutable
class TicketCategory extends Model {
  static const classType = const _TicketCategoryModelType();
  final String id;
  final double? _price;
  final String? _name;
  final int? _color;
  final int? _maxCapacity;
  final int? _totalAssistants;
  final Event? _event;
  final List<Ticket>? _tickets;
  final String? _description;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get color {
    try {
      return _color!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get maxCapacity {
    try {
      return _maxCapacity!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get totalAssistants {
    try {
      return _totalAssistants!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  List<Ticket>? get tickets {
    return _tickets;
  }
  
  String? get description {
    return _description;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TicketCategory._internal({required this.id, required price, required name, required color, required maxCapacity, required totalAssistants, required event, tickets, description, createdAt, updatedAt}): _price = price, _name = name, _color = color, _maxCapacity = maxCapacity, _totalAssistants = totalAssistants, _event = event, _tickets = tickets, _description = description, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TicketCategory({String? id, required double price, required String name, required int color, required int maxCapacity, required int totalAssistants, required Event event, List<Ticket>? tickets, String? description}) {
    return TicketCategory._internal(
      id: id == null ? UUID.getUUID() : id,
      price: price,
      name: name,
      color: color,
      maxCapacity: maxCapacity,
      totalAssistants: totalAssistants,
      event: event,
      tickets: tickets != null ? List<Ticket>.unmodifiable(tickets) : tickets,
      description: description);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TicketCategory &&
      id == other.id &&
      _price == other._price &&
      _name == other._name &&
      _color == other._color &&
      _maxCapacity == other._maxCapacity &&
      _totalAssistants == other._totalAssistants &&
      _event == other._event &&
      DeepCollectionEquality().equals(_tickets, other._tickets) &&
      _description == other._description;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TicketCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("color=" + (_color != null ? _color!.toString() : "null") + ", ");
    buffer.write("maxCapacity=" + (_maxCapacity != null ? _maxCapacity!.toString() : "null") + ", ");
    buffer.write("totalAssistants=" + (_totalAssistants != null ? _totalAssistants!.toString() : "null") + ", ");
    buffer.write("event=" + (_event != null ? _event!.toString() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TicketCategory copyWith({String? id, double? price, String? name, int? color, int? maxCapacity, int? totalAssistants, Event? event, List<Ticket>? tickets, String? description}) {
    return TicketCategory._internal(
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      color: color ?? this.color,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      totalAssistants: totalAssistants ?? this.totalAssistants,
      event: event ?? this.event,
      tickets: tickets ?? this.tickets,
      description: description ?? this.description);
  }
  
  TicketCategory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _price = (json['price'] as num?)?.toDouble(),
      _name = json['name'],
      _color = (json['color'] as num?)?.toInt(),
      _maxCapacity = (json['maxCapacity'] as num?)?.toInt(),
      _totalAssistants = (json['totalAssistants'] as num?)?.toInt(),
      _event = json['event']?['serializedData'] != null
        ? Event.fromJson(new Map<String, dynamic>.from(json['event']['serializedData']))
        : null,
      _tickets = json['tickets'] is List
        ? (json['tickets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Ticket.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _description = json['description'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'price': _price, 'name': _name, 'color': _color, 'maxCapacity': _maxCapacity, 'totalAssistants': _totalAssistants, 'event': _event?.toJson(), 'tickets': _tickets?.map((Ticket? e) => e?.toJson()).toList(), 'description': _description, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'price': _price, 'name': _name, 'color': _color, 'maxCapacity': _maxCapacity, 'totalAssistants': _totalAssistants, 'event': _event, 'tickets': _tickets, 'description': _description, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField COLOR = QueryField(fieldName: "color");
  static final QueryField MAXCAPACITY = QueryField(fieldName: "maxCapacity");
  static final QueryField TOTALASSISTANTS = QueryField(fieldName: "totalAssistants");
  static final QueryField EVENT = QueryField(
    fieldName: "event",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final QueryField TICKETS = QueryField(
    fieldName: "tickets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TicketCategory";
    modelSchemaDefinition.pluralName = "TicketCategories";
    
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
      ModelIndex(fields: const ["id"], name: null),
      ModelIndex(fields: const ["eventID", "price"], name: "byEvent")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TicketCategory.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TicketCategory.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TicketCategory.COLOR,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TicketCategory.MAXCAPACITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TicketCategory.TOTALASSISTANTS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: TicketCategory.EVENT,
      isRequired: true,
      targetName: 'eventID',
      ofModelName: 'Event'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: TicketCategory.TICKETS,
      isRequired: true,
      ofModelName: 'Ticket',
      associatedKey: Ticket.TICKETCATEGORY
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TicketCategory.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TicketCategoryModelType extends ModelType<TicketCategory> {
  const _TicketCategoryModelType();
  
  @override
  TicketCategory fromJson(Map<String, dynamic> jsonData) {
    return TicketCategory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TicketCategory';
  }
}