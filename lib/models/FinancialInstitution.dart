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


/** This is an auto generated class representing the FinancialInstitution type in your schema. */
class FinancialInstitution {
  final String? _financial_institution_code;
  final String? _financial_institution_name;

  String get financial_institution_code {
    try {
      return _financial_institution_code!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get financial_institution_name {
    try {
      return _financial_institution_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const FinancialInstitution._internal({required financial_institution_code, required financial_institution_name}): _financial_institution_code = financial_institution_code, _financial_institution_name = financial_institution_name;
  
  factory FinancialInstitution({required String financial_institution_code, required String financial_institution_name}) {
    return FinancialInstitution._internal(
      financial_institution_code: financial_institution_code,
      financial_institution_name: financial_institution_name);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinancialInstitution &&
      _financial_institution_code == other._financial_institution_code &&
      _financial_institution_name == other._financial_institution_name;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FinancialInstitution {");
    buffer.write("financial_institution_code=" + "$_financial_institution_code" + ", ");
    buffer.write("financial_institution_name=" + "$_financial_institution_name");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FinancialInstitution copyWith({String? financial_institution_code, String? financial_institution_name}) {
    return FinancialInstitution._internal(
      financial_institution_code: financial_institution_code ?? this.financial_institution_code,
      financial_institution_name: financial_institution_name ?? this.financial_institution_name);
  }
  
  FinancialInstitution copyWithModelFieldValues({
    ModelFieldValue<String>? financial_institution_code,
    ModelFieldValue<String>? financial_institution_name
  }) {
    return FinancialInstitution._internal(
      financial_institution_code: financial_institution_code == null ? this.financial_institution_code : financial_institution_code.value,
      financial_institution_name: financial_institution_name == null ? this.financial_institution_name : financial_institution_name.value
    );
  }
  
  FinancialInstitution.fromJson(Map<String, dynamic> json)  
    : _financial_institution_code = json['financial_institution_code'],
      _financial_institution_name = json['financial_institution_name'];
  
  Map<String, dynamic> toJson() => {
    'financial_institution_code': _financial_institution_code, 'financial_institution_name': _financial_institution_name
  };
  
  Map<String, Object?> toMap() => {
    'financial_institution_code': _financial_institution_code,
    'financial_institution_name': _financial_institution_name
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FinancialInstitution";
    modelSchemaDefinition.pluralName = "FinancialInstitutions";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'financial_institution_code',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'financial_institution_name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}