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


/** This is an auto generated class representing the TokenNequiResData type in your schema. */
class TokenNequiResData {
  final String id;
  final String? _status;
  final String? _phone_number;
  final String? _name;

  String get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phone_number {
    try {
      return _phone_number!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get name {
    return _name;
  }
  
  const TokenNequiResData._internal({required this.id, required status, required phone_number, name}): _status = status, _phone_number = phone_number, _name = name;
  
  factory TokenNequiResData({String? id, required String status, required String phone_number, String? name}) {
    return TokenNequiResData._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      status: status,
      phone_number: phone_number,
      name: name);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenNequiResData &&
      id == other.id &&
      _status == other._status &&
      _phone_number == other._phone_number &&
      _name == other._name;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TokenNequiResData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("phone_number=" + "$_phone_number" + ", ");
    buffer.write("name=" + "$_name");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TokenNequiResData copyWith({String? id, String? status, String? phone_number, String? name}) {
    return TokenNequiResData._internal(
      id: id ?? this.id,
      status: status ?? this.status,
      phone_number: phone_number ?? this.phone_number,
      name: name ?? this.name);
  }
  
  TokenNequiResData copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? status,
    ModelFieldValue<String>? phone_number,
    ModelFieldValue<String?>? name
  }) {
    return TokenNequiResData._internal(
      id: id == null ? this.id : id.value,
      status: status == null ? this.status : status.value,
      phone_number: phone_number == null ? this.phone_number : phone_number.value,
      name: name == null ? this.name : name.value
    );
  }
  
  TokenNequiResData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _status = json['status'],
      _phone_number = json['phone_number'],
      _name = json['name'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'status': _status, 'phone_number': _phone_number, 'name': _name
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'status': _status,
    'phone_number': _phone_number,
    'name': _name
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TokenNequiResData";
    modelSchemaDefinition.pluralName = "TokenNequiResData";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'phone_number',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}