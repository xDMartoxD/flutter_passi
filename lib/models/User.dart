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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _email;
  final String? _name;
  final S3Object? _avatar;
  final List<Ticket>? _tickets;
  final List<Job>? _jobs;
  final List<DiscountCode>? _codes;
  final List<PaymentMethod>? _paymentMethods;
  final PaymentMethod? _selectedPaymentMethod;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _userSelectedPaymentMethodId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelIdentifier get modelIdentifier {
      return UserModelIdentifier(
        id: id
      );
  }
  
  String get email {
    try {
      return _email!;
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
  
  S3Object? get avatar {
    return _avatar;
  }
  
  List<Ticket>? get tickets {
    return _tickets;
  }
  
  List<Job>? get jobs {
    return _jobs;
  }
  
  List<DiscountCode>? get codes {
    return _codes;
  }
  
  List<PaymentMethod>? get paymentMethods {
    return _paymentMethods;
  }
  
  PaymentMethod? get selectedPaymentMethod {
    return _selectedPaymentMethod;
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
  
  String? get userSelectedPaymentMethodId {
    return _userSelectedPaymentMethodId;
  }
  
  const User._internal({required this.id, required email, required name, avatar, tickets, jobs, codes, paymentMethods, selectedPaymentMethod, required createdAt, required updatedAt, userSelectedPaymentMethodId}): _email = email, _name = name, _avatar = avatar, _tickets = tickets, _jobs = jobs, _codes = codes, _paymentMethods = paymentMethods, _selectedPaymentMethod = selectedPaymentMethod, _createdAt = createdAt, _updatedAt = updatedAt, _userSelectedPaymentMethodId = userSelectedPaymentMethodId;
  
  factory User({String? id, required String email, required String name, S3Object? avatar, List<Ticket>? tickets, List<Job>? jobs, List<DiscountCode>? codes, List<PaymentMethod>? paymentMethods, PaymentMethod? selectedPaymentMethod, required TemporalDateTime createdAt, required TemporalDateTime updatedAt, String? userSelectedPaymentMethodId}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      name: name,
      avatar: avatar,
      tickets: tickets != null ? List<Ticket>.unmodifiable(tickets) : tickets,
      jobs: jobs != null ? List<Job>.unmodifiable(jobs) : jobs,
      codes: codes != null ? List<DiscountCode>.unmodifiable(codes) : codes,
      paymentMethods: paymentMethods != null ? List<PaymentMethod>.unmodifiable(paymentMethods) : paymentMethods,
      selectedPaymentMethod: selectedPaymentMethod,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userSelectedPaymentMethodId: userSelectedPaymentMethodId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _email == other._email &&
      _name == other._name &&
      _avatar == other._avatar &&
      DeepCollectionEquality().equals(_tickets, other._tickets) &&
      DeepCollectionEquality().equals(_jobs, other._jobs) &&
      DeepCollectionEquality().equals(_codes, other._codes) &&
      DeepCollectionEquality().equals(_paymentMethods, other._paymentMethods) &&
      _selectedPaymentMethod == other._selectedPaymentMethod &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _userSelectedPaymentMethodId == other._userSelectedPaymentMethodId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("avatar=" + (_avatar != null ? _avatar!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("userSelectedPaymentMethodId=" + "$_userSelectedPaymentMethodId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? email, String? name, S3Object? avatar, List<Ticket>? tickets, List<Job>? jobs, List<DiscountCode>? codes, List<PaymentMethod>? paymentMethods, PaymentMethod? selectedPaymentMethod, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, String? userSelectedPaymentMethodId}) {
    return User._internal(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      tickets: tickets ?? this.tickets,
      jobs: jobs ?? this.jobs,
      codes: codes ?? this.codes,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userSelectedPaymentMethodId: userSelectedPaymentMethodId ?? this.userSelectedPaymentMethodId);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _name = json['name'],
      _avatar = json['avatar']?['serializedData'] != null
        ? S3Object.fromJson(new Map<String, dynamic>.from(json['avatar']['serializedData']))
        : null,
      _tickets = json['tickets'] is List
        ? (json['tickets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Ticket.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _jobs = json['jobs'] is List
        ? (json['jobs'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Job.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _codes = json['codes'] is List
        ? (json['codes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => DiscountCode.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _paymentMethods = json['paymentMethods'] is List
        ? (json['paymentMethods'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => PaymentMethod.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _selectedPaymentMethod = json['selectedPaymentMethod']?['serializedData'] != null
        ? PaymentMethod.fromJson(new Map<String, dynamic>.from(json['selectedPaymentMethod']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _userSelectedPaymentMethodId = json['userSelectedPaymentMethodId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'name': _name, 'avatar': _avatar?.toJson(), 'tickets': _tickets?.map((Ticket? e) => e?.toJson()).toList(), 'jobs': _jobs?.map((Job? e) => e?.toJson()).toList(), 'codes': _codes?.map((DiscountCode? e) => e?.toJson()).toList(), 'paymentMethods': _paymentMethods?.map((PaymentMethod? e) => e?.toJson()).toList(), 'selectedPaymentMethod': _selectedPaymentMethod?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'userSelectedPaymentMethodId': _userSelectedPaymentMethodId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'email': _email, 'name': _name, 'avatar': _avatar, 'tickets': _tickets, 'jobs': _jobs, 'codes': _codes, 'paymentMethods': _paymentMethods, 'selectedPaymentMethod': _selectedPaymentMethod, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'userSelectedPaymentMethodId': _userSelectedPaymentMethodId
  };

  static final QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<UserModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField AVATAR = QueryField(fieldName: "avatar");
  static final QueryField TICKETS = QueryField(
    fieldName: "tickets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final QueryField JOBS = QueryField(
    fieldName: "jobs",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Job'));
  static final QueryField CODES = QueryField(
    fieldName: "codes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'DiscountCode'));
  static final QueryField PAYMENTMETHODS = QueryField(
    fieldName: "paymentMethods",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'PaymentMethod'));
  static final QueryField SELECTEDPAYMENTMETHOD = QueryField(
    fieldName: "selectedPaymentMethod",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'PaymentMethod'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField USERSELECTEDPAYMENTMETHODID = QueryField(fieldName: "userSelectedPaymentMethodId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "id",
        identityClaim: "cognito:username",
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
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["id"], name: null)
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'avatar',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'S3Object')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.TICKETS,
      isRequired: true,
      ofModelName: 'Ticket',
      associatedKey: Ticket.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.JOBS,
      isRequired: true,
      ofModelName: 'Job',
      associatedKey: Job.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.CODES,
      isRequired: true,
      ofModelName: 'DiscountCode',
      associatedKey: DiscountCode.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.PAYMENTMETHODS,
      isRequired: true,
      ofModelName: 'PaymentMethod',
      associatedKey: PaymentMethod.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: User.SELECTEDPAYMENTMETHOD,
      isRequired: false,
      ofModelName: 'PaymentMethod',
      associatedKey: PaymentMethod.USER
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.UPDATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERSELECTEDPAYMENTMETHODID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
@immutable
class UserModelIdentifier implements ModelIdentifier<User> {
  final String id;

  /** Create an instance of UserModelIdentifier using [id] the primary key. */
  const UserModelIdentifier({
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
  String toString() => 'UserModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}