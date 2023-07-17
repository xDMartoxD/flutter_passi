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


/** This is an auto generated class representing the TokenCardRes type in your schema. */
class TokenCardRes {
  final String? _status;
  final TokenCardResData? _data;

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
  
  TokenCardResData? get data {
    return _data;
  }
  
  const TokenCardRes._internal({required status, data}): _status = status, _data = data;
  
  factory TokenCardRes({required String status, TokenCardResData? data}) {
    return TokenCardRes._internal(
      status: status,
      data: data);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenCardRes &&
      _status == other._status &&
      _data == other._data;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TokenCardRes {");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("data=" + (_data != null ? _data!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TokenCardRes copyWith({String? status, TokenCardResData? data}) {
    return TokenCardRes._internal(
      status: status ?? this.status,
      data: data ?? this.data);
  }
  
  TokenCardRes copyWithModelFieldValues({
    ModelFieldValue<String>? status,
    ModelFieldValue<TokenCardResData?>? data
  }) {
    return TokenCardRes._internal(
      status: status == null ? this.status : status.value,
      data: data == null ? this.data : data.value
    );
  }
  
  TokenCardRes.fromJson(Map<String, dynamic> json)  
    : _status = json['status'],
      _data = json['data']?['serializedData'] != null
        ? TokenCardResData.fromJson(new Map<String, dynamic>.from(json['data']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'status': _status, 'data': _data?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'status': _status,
    'data': _data
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TokenCardRes";
    modelSchemaDefinition.pluralName = "TokenCardRes";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'data',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'TokenCardResData')
    ));
  });
}