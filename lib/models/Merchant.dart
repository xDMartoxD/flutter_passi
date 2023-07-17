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


/** This is an auto generated class representing the Merchant type in your schema. */
class Merchant {
  final String? _name;
  final String? _legal_name;
  final String? _contact_name;
  final String? _phone_number;
  final String? _logo_url;
  final String? _legal_id_type;
  final String? _email;
  final String? _legal_id;

  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get legal_name {
    try {
      return _legal_name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get contact_name {
    try {
      return _contact_name!;
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
  
  String get logo_url {
    try {
      return _logo_url!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get legal_id_type {
    try {
      return _legal_id_type!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get legal_id {
    try {
      return _legal_id!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Merchant._internal({required name, required legal_name, required contact_name, required phone_number, required logo_url, required legal_id_type, required email, required legal_id}): _name = name, _legal_name = legal_name, _contact_name = contact_name, _phone_number = phone_number, _logo_url = logo_url, _legal_id_type = legal_id_type, _email = email, _legal_id = legal_id;
  
  factory Merchant({required String name, required String legal_name, required String contact_name, required String phone_number, required String logo_url, required String legal_id_type, required String email, required String legal_id}) {
    return Merchant._internal(
      name: name,
      legal_name: legal_name,
      contact_name: contact_name,
      phone_number: phone_number,
      logo_url: logo_url,
      legal_id_type: legal_id_type,
      email: email,
      legal_id: legal_id);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Merchant &&
      _name == other._name &&
      _legal_name == other._legal_name &&
      _contact_name == other._contact_name &&
      _phone_number == other._phone_number &&
      _logo_url == other._logo_url &&
      _legal_id_type == other._legal_id_type &&
      _email == other._email &&
      _legal_id == other._legal_id;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Merchant {");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("legal_name=" + "$_legal_name" + ", ");
    buffer.write("contact_name=" + "$_contact_name" + ", ");
    buffer.write("phone_number=" + "$_phone_number" + ", ");
    buffer.write("logo_url=" + "$_logo_url" + ", ");
    buffer.write("legal_id_type=" + "$_legal_id_type" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("legal_id=" + "$_legal_id");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Merchant copyWith({String? name, String? legal_name, String? contact_name, String? phone_number, String? logo_url, String? legal_id_type, String? email, String? legal_id}) {
    return Merchant._internal(
      name: name ?? this.name,
      legal_name: legal_name ?? this.legal_name,
      contact_name: contact_name ?? this.contact_name,
      phone_number: phone_number ?? this.phone_number,
      logo_url: logo_url ?? this.logo_url,
      legal_id_type: legal_id_type ?? this.legal_id_type,
      email: email ?? this.email,
      legal_id: legal_id ?? this.legal_id);
  }
  
  Merchant copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<String>? legal_name,
    ModelFieldValue<String>? contact_name,
    ModelFieldValue<String>? phone_number,
    ModelFieldValue<String>? logo_url,
    ModelFieldValue<String>? legal_id_type,
    ModelFieldValue<String>? email,
    ModelFieldValue<String>? legal_id
  }) {
    return Merchant._internal(
      name: name == null ? this.name : name.value,
      legal_name: legal_name == null ? this.legal_name : legal_name.value,
      contact_name: contact_name == null ? this.contact_name : contact_name.value,
      phone_number: phone_number == null ? this.phone_number : phone_number.value,
      logo_url: logo_url == null ? this.logo_url : logo_url.value,
      legal_id_type: legal_id_type == null ? this.legal_id_type : legal_id_type.value,
      email: email == null ? this.email : email.value,
      legal_id: legal_id == null ? this.legal_id : legal_id.value
    );
  }
  
  Merchant.fromJson(Map<String, dynamic> json)  
    : _name = json['name'],
      _legal_name = json['legal_name'],
      _contact_name = json['contact_name'],
      _phone_number = json['phone_number'],
      _logo_url = json['logo_url'],
      _legal_id_type = json['legal_id_type'],
      _email = json['email'],
      _legal_id = json['legal_id'];
  
  Map<String, dynamic> toJson() => {
    'name': _name, 'legal_name': _legal_name, 'contact_name': _contact_name, 'phone_number': _phone_number, 'logo_url': _logo_url, 'legal_id_type': _legal_id_type, 'email': _email, 'legal_id': _legal_id
  };
  
  Map<String, Object?> toMap() => {
    'name': _name,
    'legal_name': _legal_name,
    'contact_name': _contact_name,
    'phone_number': _phone_number,
    'logo_url': _logo_url,
    'legal_id_type': _legal_id_type,
    'email': _email,
    'legal_id': _legal_id
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Merchant";
    modelSchemaDefinition.pluralName = "Merchants";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'legal_name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'contact_name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'phone_number',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'logo_url',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'legal_id_type',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'email',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'legal_id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}