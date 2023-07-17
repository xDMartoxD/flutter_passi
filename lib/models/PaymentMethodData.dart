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


/** This is an auto generated class representing the PaymentMethodData type in your schema. */
class PaymentMethodData {
  final String id;
  final String? _status;
  final String? _phone_number;
  final String? _name;
  final String? _created_at;
  final BrandEnum? _brand;
  final String? _last_four;
  final String? _bin;
  final String? _exp_year;
  final String? _exp_month;
  final String? _card_holder;
  final String? _expires_at;

  String? get status {
    return _status;
  }
  
  String? get phone_number {
    return _phone_number;
  }
  
  String? get name {
    return _name;
  }
  
  String? get created_at {
    return _created_at;
  }
  
  BrandEnum? get brand {
    return _brand;
  }
  
  String? get last_four {
    return _last_four;
  }
  
  String? get bin {
    return _bin;
  }
  
  String? get exp_year {
    return _exp_year;
  }
  
  String? get exp_month {
    return _exp_month;
  }
  
  String? get card_holder {
    return _card_holder;
  }
  
  String? get expires_at {
    return _expires_at;
  }
  
  const PaymentMethodData._internal({required this.id, status, phone_number, name, created_at, brand, last_four, bin, exp_year, exp_month, card_holder, expires_at}): _status = status, _phone_number = phone_number, _name = name, _created_at = created_at, _brand = brand, _last_four = last_four, _bin = bin, _exp_year = exp_year, _exp_month = exp_month, _card_holder = card_holder, _expires_at = expires_at;
  
  factory PaymentMethodData({String? id, String? status, String? phone_number, String? name, String? created_at, BrandEnum? brand, String? last_four, String? bin, String? exp_year, String? exp_month, String? card_holder, String? expires_at}) {
    return PaymentMethodData._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      status: status,
      phone_number: phone_number,
      name: name,
      created_at: created_at,
      brand: brand,
      last_four: last_four,
      bin: bin,
      exp_year: exp_year,
      exp_month: exp_month,
      card_holder: card_holder,
      expires_at: expires_at);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentMethodData &&
      id == other.id &&
      _status == other._status &&
      _phone_number == other._phone_number &&
      _name == other._name &&
      _created_at == other._created_at &&
      _brand == other._brand &&
      _last_four == other._last_four &&
      _bin == other._bin &&
      _exp_year == other._exp_year &&
      _exp_month == other._exp_month &&
      _card_holder == other._card_holder &&
      _expires_at == other._expires_at;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("PaymentMethodData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("phone_number=" + "$_phone_number" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("created_at=" + "$_created_at" + ", ");
    buffer.write("brand=" + (_brand != null ? amplify_core.enumToString(_brand)! : "null") + ", ");
    buffer.write("last_four=" + "$_last_four" + ", ");
    buffer.write("bin=" + "$_bin" + ", ");
    buffer.write("exp_year=" + "$_exp_year" + ", ");
    buffer.write("exp_month=" + "$_exp_month" + ", ");
    buffer.write("card_holder=" + "$_card_holder" + ", ");
    buffer.write("expires_at=" + "$_expires_at");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  PaymentMethodData copyWith({String? id, String? status, String? phone_number, String? name, String? created_at, BrandEnum? brand, String? last_four, String? bin, String? exp_year, String? exp_month, String? card_holder, String? expires_at}) {
    return PaymentMethodData._internal(
      id: id ?? this.id,
      status: status ?? this.status,
      phone_number: phone_number ?? this.phone_number,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      brand: brand ?? this.brand,
      last_four: last_four ?? this.last_four,
      bin: bin ?? this.bin,
      exp_year: exp_year ?? this.exp_year,
      exp_month: exp_month ?? this.exp_month,
      card_holder: card_holder ?? this.card_holder,
      expires_at: expires_at ?? this.expires_at);
  }
  
  PaymentMethodData copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? status,
    ModelFieldValue<String?>? phone_number,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? created_at,
    ModelFieldValue<BrandEnum?>? brand,
    ModelFieldValue<String?>? last_four,
    ModelFieldValue<String?>? bin,
    ModelFieldValue<String?>? exp_year,
    ModelFieldValue<String?>? exp_month,
    ModelFieldValue<String?>? card_holder,
    ModelFieldValue<String?>? expires_at
  }) {
    return PaymentMethodData._internal(
      id: id == null ? this.id : id.value,
      status: status == null ? this.status : status.value,
      phone_number: phone_number == null ? this.phone_number : phone_number.value,
      name: name == null ? this.name : name.value,
      created_at: created_at == null ? this.created_at : created_at.value,
      brand: brand == null ? this.brand : brand.value,
      last_four: last_four == null ? this.last_four : last_four.value,
      bin: bin == null ? this.bin : bin.value,
      exp_year: exp_year == null ? this.exp_year : exp_year.value,
      exp_month: exp_month == null ? this.exp_month : exp_month.value,
      card_holder: card_holder == null ? this.card_holder : card_holder.value,
      expires_at: expires_at == null ? this.expires_at : expires_at.value
    );
  }
  
  PaymentMethodData.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _status = json['status'],
      _phone_number = json['phone_number'],
      _name = json['name'],
      _created_at = json['created_at'],
      _brand = amplify_core.enumFromString<BrandEnum>(json['brand'], BrandEnum.values),
      _last_four = json['last_four'],
      _bin = json['bin'],
      _exp_year = json['exp_year'],
      _exp_month = json['exp_month'],
      _card_holder = json['card_holder'],
      _expires_at = json['expires_at'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'status': _status, 'phone_number': _phone_number, 'name': _name, 'created_at': _created_at, 'brand': amplify_core.enumToString(_brand), 'last_four': _last_four, 'bin': _bin, 'exp_year': _exp_year, 'exp_month': _exp_month, 'card_holder': _card_holder, 'expires_at': _expires_at
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'status': _status,
    'phone_number': _phone_number,
    'name': _name,
    'created_at': _created_at,
    'brand': _brand,
    'last_four': _last_four,
    'bin': _bin,
    'exp_year': _exp_year,
    'exp_month': _exp_month,
    'card_holder': _card_holder,
    'expires_at': _expires_at
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PaymentMethodData";
    modelSchemaDefinition.pluralName = "PaymentMethodData";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'phone_number',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'created_at',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'brand',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'last_four',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'bin',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'exp_year',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'exp_month',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'card_holder',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'expires_at',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}