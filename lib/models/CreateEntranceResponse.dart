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


/** This is an auto generated class representing the CreateEntranceResponse type in your schema. */
class CreateEntranceResponse {
  final String? _data;
  final String? _errors;

  String? get data {
    return _data;
  }
  
  String? get errors {
    return _errors;
  }
  
  const CreateEntranceResponse._internal({data, errors}): _data = data, _errors = errors;
  
  factory CreateEntranceResponse({String? data, String? errors}) {
    return CreateEntranceResponse._internal(
      data: data,
      errors: errors);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateEntranceResponse &&
      _data == other._data &&
      _errors == other._errors;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CreateEntranceResponse {");
    buffer.write("data=" + "$_data" + ", ");
    buffer.write("errors=" + "$_errors");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CreateEntranceResponse copyWith({String? data, String? errors}) {
    return CreateEntranceResponse._internal(
      data: data ?? this.data,
      errors: errors ?? this.errors);
  }
  
  CreateEntranceResponse copyWithModelFieldValues({
    ModelFieldValue<String?>? data,
    ModelFieldValue<String?>? errors
  }) {
    return CreateEntranceResponse._internal(
      data: data == null ? this.data : data.value,
      errors: errors == null ? this.errors : errors.value
    );
  }
  
  CreateEntranceResponse.fromJson(Map<String, dynamic> json)  
    : _data = json['data'],
      _errors = json['errors'];
  
  Map<String, dynamic> toJson() => {
    'data': _data, 'errors': _errors
  };
  
  Map<String, Object?> toMap() => {
    'data': _data,
    'errors': _errors
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CreateEntranceResponse";
    modelSchemaDefinition.pluralName = "CreateEntranceResponses";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'data',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'errors',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}