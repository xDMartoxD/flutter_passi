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


/** This is an auto generated class representing the PaymentMethod type in your schema. */
class PaymentMethod extends amplify_core.Model {
  static const classType = const _PaymentMethodModelType();
  final String id;
  final User? _user;
  final PaymentMethodEnum? _type;
  final String? _status;
  final PaymentMethodData? _data;
  final String? _token;
  final String? _customer_email;
  final String? _acceptance_token;
  final int? _paymentSourceID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PaymentMethodModelIdentifier get modelIdentifier {
      return PaymentMethodModelIdentifier(
        id: id
      );
  }
  
  User? get user {
    return _user;
  }
  
  PaymentMethodEnum get type {
    try {
      return _type!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get status {
    return _status;
  }
  
  PaymentMethodData get data {
    try {
      return _data!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get token {
    try {
      return _token!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get customer_email {
    try {
      return _customer_email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get acceptance_token {
    return _acceptance_token;
  }
  
  int? get paymentSourceID {
    return _paymentSourceID;
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
  
  const PaymentMethod._internal({required this.id, user, required type, status, required data, required token, required customer_email, acceptance_token, paymentSourceID, required createdAt, required updatedAt}): _user = user, _type = type, _status = status, _data = data, _token = token, _customer_email = customer_email, _acceptance_token = acceptance_token, _paymentSourceID = paymentSourceID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory PaymentMethod({String? id, User? user, required PaymentMethodEnum type, String? status, required PaymentMethodData data, required String token, required String customer_email, String? acceptance_token, int? paymentSourceID, required amplify_core.TemporalDateTime createdAt, required amplify_core.TemporalDateTime updatedAt}) {
    return PaymentMethod._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      user: user,
      type: type,
      status: status,
      data: data,
      token: token,
      customer_email: customer_email,
      acceptance_token: acceptance_token,
      paymentSourceID: paymentSourceID,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentMethod &&
      id == other.id &&
      _user == other._user &&
      _type == other._type &&
      _status == other._status &&
      _data == other._data &&
      _token == other._token &&
      _customer_email == other._customer_email &&
      _acceptance_token == other._acceptance_token &&
      _paymentSourceID == other._paymentSourceID &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PaymentMethod {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("type=" + (_type != null ? amplify_core.enumToString(_type)! : "null") + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("data=" + (_data != null ? _data!.toString() : "null") + ", ");
    buffer.write("token=" + "$_token" + ", ");
    buffer.write("customer_email=" + "$_customer_email" + ", ");
    buffer.write("acceptance_token=" + "$_acceptance_token" + ", ");
    buffer.write("paymentSourceID=" + (_paymentSourceID != null ? _paymentSourceID!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PaymentMethod copyWith({User? user, PaymentMethodEnum? type, String? status, PaymentMethodData? data, String? token, String? customer_email, String? acceptance_token, int? paymentSourceID, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return PaymentMethod._internal(
      id: id,
      user: user ?? this.user,
      type: type ?? this.type,
      status: status ?? this.status,
      data: data ?? this.data,
      token: token ?? this.token,
      customer_email: customer_email ?? this.customer_email,
      acceptance_token: acceptance_token ?? this.acceptance_token,
      paymentSourceID: paymentSourceID ?? this.paymentSourceID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  PaymentMethod copyWithModelFieldValues({
    ModelFieldValue<User?>? user,
    ModelFieldValue<PaymentMethodEnum>? type,
    ModelFieldValue<String?>? status,
    ModelFieldValue<PaymentMethodData>? data,
    ModelFieldValue<String>? token,
    ModelFieldValue<String>? customer_email,
    ModelFieldValue<String?>? acceptance_token,
    ModelFieldValue<int?>? paymentSourceID,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime>? updatedAt
  }) {
    return PaymentMethod._internal(
      id: id,
      user: user == null ? this.user : user.value,
      type: type == null ? this.type : type.value,
      status: status == null ? this.status : status.value,
      data: data == null ? this.data : data.value,
      token: token == null ? this.token : token.value,
      customer_email: customer_email == null ? this.customer_email : customer_email.value,
      acceptance_token: acceptance_token == null ? this.acceptance_token : acceptance_token.value,
      paymentSourceID: paymentSourceID == null ? this.paymentSourceID : paymentSourceID.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  PaymentMethod.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _type = amplify_core.enumFromString<PaymentMethodEnum>(json['type'], PaymentMethodEnum.values),
      _status = json['status'],
      _data = json['data']?['serializedData'] != null
        ? PaymentMethodData.fromJson(new Map<String, dynamic>.from(json['data']['serializedData']))
        : null,
      _token = json['token'],
      _customer_email = json['customer_email'],
      _acceptance_token = json['acceptance_token'],
      _paymentSourceID = (json['paymentSourceID'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'user': _user?.toJson(), 'type': amplify_core.enumToString(_type), 'status': _status, 'data': _data?.toJson(), 'token': _token, 'customer_email': _customer_email, 'acceptance_token': _acceptance_token, 'paymentSourceID': _paymentSourceID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'user': _user,
    'type': _type,
    'status': _status,
    'data': _data,
    'token': _token,
    'customer_email': _customer_email,
    'acceptance_token': _acceptance_token,
    'paymentSourceID': _paymentSourceID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PaymentMethodModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PaymentMethodModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final TYPE = amplify_core.QueryField(fieldName: "type");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final DATA = amplify_core.QueryField(fieldName: "data");
  static final TOKEN = amplify_core.QueryField(fieldName: "token");
  static final CUSTOMER_EMAIL = amplify_core.QueryField(fieldName: "customer_email");
  static final ACCEPTANCE_TOKEN = amplify_core.QueryField(fieldName: "acceptance_token");
  static final PAYMENTSOURCEID = amplify_core.QueryField(fieldName: "paymentSourceID");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PaymentMethod";
    modelSchemaDefinition.pluralName = "PaymentMethods";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "userID",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.DELETE
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
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: PaymentMethod.USER,
      isRequired: false,
      targetNames: ['userID'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.TYPE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'data',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'PaymentMethodData')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.TOKEN,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.CUSTOMER_EMAIL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.ACCEPTANCE_TOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.PAYMENTSOURCEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.CREATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: PaymentMethod.UPDATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PaymentMethodModelType extends amplify_core.ModelType<PaymentMethod> {
  const _PaymentMethodModelType();
  
  @override
  PaymentMethod fromJson(Map<String, dynamic> jsonData) {
    return PaymentMethod.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'PaymentMethod';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [PaymentMethod] in your schema.
 */
class PaymentMethodModelIdentifier implements amplify_core.ModelIdentifier<PaymentMethod> {
  final String id;

  /** Create an instance of PaymentMethodModelIdentifier using [id] the primary key. */
  const PaymentMethodModelIdentifier({
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
  String toString() => 'PaymentMethodModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PaymentMethodModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}