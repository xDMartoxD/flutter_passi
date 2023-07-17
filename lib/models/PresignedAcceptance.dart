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


/** This is an auto generated class representing the PresignedAcceptance type in your schema. */
class PresignedAcceptance {
  final String? _acceptance_token;
  final String? _permalink;
  final String? _type;

  String get acceptance_token {
    try {
      return _acceptance_token!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get permalink {
    try {
      return _permalink!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get type {
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
  
  const PresignedAcceptance._internal({required acceptance_token, required permalink, required type}): _acceptance_token = acceptance_token, _permalink = permalink, _type = type;
  
  factory PresignedAcceptance({required String acceptance_token, required String permalink, required String type}) {
    return PresignedAcceptance._internal(
      acceptance_token: acceptance_token,
      permalink: permalink,
      type: type);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PresignedAcceptance &&
      _acceptance_token == other._acceptance_token &&
      _permalink == other._permalink &&
      _type == other._type;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PresignedAcceptance {");
    buffer.write("acceptance_token=" + "$_acceptance_token" + ", ");
    buffer.write("permalink=" + "$_permalink" + ", ");
    buffer.write("type=" + "$_type");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PresignedAcceptance copyWith({String? acceptance_token, String? permalink, String? type}) {
    return PresignedAcceptance._internal(
      acceptance_token: acceptance_token ?? this.acceptance_token,
      permalink: permalink ?? this.permalink,
      type: type ?? this.type);
  }
  
  PresignedAcceptance copyWithModelFieldValues({
    ModelFieldValue<String>? acceptance_token,
    ModelFieldValue<String>? permalink,
    ModelFieldValue<String>? type
  }) {
    return PresignedAcceptance._internal(
      acceptance_token: acceptance_token == null ? this.acceptance_token : acceptance_token.value,
      permalink: permalink == null ? this.permalink : permalink.value,
      type: type == null ? this.type : type.value
    );
  }
  
  PresignedAcceptance.fromJson(Map<String, dynamic> json)  
    : _acceptance_token = json['acceptance_token'],
      _permalink = json['permalink'],
      _type = json['type'];
  
  Map<String, dynamic> toJson() => {
    'acceptance_token': _acceptance_token, 'permalink': _permalink, 'type': _type
  };
  
  Map<String, Object?> toMap() => {
    'acceptance_token': _acceptance_token,
    'permalink': _permalink,
    'type': _type
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PresignedAcceptance";
    modelSchemaDefinition.pluralName = "PresignedAcceptances";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'acceptance_token',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'permalink',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'type',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}