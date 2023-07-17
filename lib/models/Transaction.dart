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


/** This is an auto generated class representing the Transaction type in your schema. */
class Transaction {
  final String id;
  final int? _amount_in_cents;
  final String? _status;
  final String? _reference;
  final String? _payment_method_type;
  final String? _redirect_url;
  final amplify_core.TemporalDateTime? _created_at;
  final String? _finalized_at;
  final String? _customer_email;
  final String? _currency;
  final String? _status_message;
  final int? _user_type;
  final String? _user_legal_id;
  final String? _user_legal_id_type;
  final String? _payment_description;
  final String? _financial_institution_code;
  final String? _async_payment_url;

  int get amount_in_cents {
    try {
      return _amount_in_cents!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
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
  
  String get reference {
    try {
      return _reference!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get payment_method_type {
    try {
      return _payment_method_type!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get redirect_url {
    return _redirect_url;
  }
  
  amplify_core.TemporalDateTime? get created_at {
    return _created_at;
  }
  
  String? get finalized_at {
    return _finalized_at;
  }
  
  String? get customer_email {
    return _customer_email;
  }
  
  String? get currency {
    return _currency;
  }
  
  String? get status_message {
    return _status_message;
  }
  
  int? get user_type {
    return _user_type;
  }
  
  String? get user_legal_id {
    return _user_legal_id;
  }
  
  String? get user_legal_id_type {
    return _user_legal_id_type;
  }
  
  String? get payment_description {
    return _payment_description;
  }
  
  String? get financial_institution_code {
    return _financial_institution_code;
  }
  
  String? get async_payment_url {
    return _async_payment_url;
  }
  
  const Transaction._internal({required this.id, required amount_in_cents, required status, required reference, required payment_method_type, redirect_url, created_at, finalized_at, customer_email, currency, status_message, user_type, user_legal_id, user_legal_id_type, payment_description, financial_institution_code, async_payment_url}): _amount_in_cents = amount_in_cents, _status = status, _reference = reference, _payment_method_type = payment_method_type, _redirect_url = redirect_url, _created_at = created_at, _finalized_at = finalized_at, _customer_email = customer_email, _currency = currency, _status_message = status_message, _user_type = user_type, _user_legal_id = user_legal_id, _user_legal_id_type = user_legal_id_type, _payment_description = payment_description, _financial_institution_code = financial_institution_code, _async_payment_url = async_payment_url;
  
  factory Transaction({String? id, required int amount_in_cents, required String status, required String reference, required String payment_method_type, String? redirect_url, amplify_core.TemporalDateTime? created_at, String? finalized_at, String? customer_email, String? currency, String? status_message, int? user_type, String? user_legal_id, String? user_legal_id_type, String? payment_description, String? financial_institution_code, String? async_payment_url}) {
    return Transaction._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      amount_in_cents: amount_in_cents,
      status: status,
      reference: reference,
      payment_method_type: payment_method_type,
      redirect_url: redirect_url,
      created_at: created_at,
      finalized_at: finalized_at,
      customer_email: customer_email,
      currency: currency,
      status_message: status_message,
      user_type: user_type,
      user_legal_id: user_legal_id,
      user_legal_id_type: user_legal_id_type,
      payment_description: payment_description,
      financial_institution_code: financial_institution_code,
      async_payment_url: async_payment_url);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
      id == other.id &&
      _amount_in_cents == other._amount_in_cents &&
      _status == other._status &&
      _reference == other._reference &&
      _payment_method_type == other._payment_method_type &&
      _redirect_url == other._redirect_url &&
      _created_at == other._created_at &&
      _finalized_at == other._finalized_at &&
      _customer_email == other._customer_email &&
      _currency == other._currency &&
      _status_message == other._status_message &&
      _user_type == other._user_type &&
      _user_legal_id == other._user_legal_id &&
      _user_legal_id_type == other._user_legal_id_type &&
      _payment_description == other._payment_description &&
      _financial_institution_code == other._financial_institution_code &&
      _async_payment_url == other._async_payment_url;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Transaction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("amount_in_cents=" + (_amount_in_cents != null ? _amount_in_cents!.toString() : "null") + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("reference=" + "$_reference" + ", ");
    buffer.write("payment_method_type=" + "$_payment_method_type" + ", ");
    buffer.write("redirect_url=" + "$_redirect_url" + ", ");
    buffer.write("created_at=" + (_created_at != null ? _created_at!.format() : "null") + ", ");
    buffer.write("finalized_at=" + "$_finalized_at" + ", ");
    buffer.write("customer_email=" + "$_customer_email" + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("status_message=" + "$_status_message" + ", ");
    buffer.write("user_type=" + (_user_type != null ? _user_type!.toString() : "null") + ", ");
    buffer.write("user_legal_id=" + "$_user_legal_id" + ", ");
    buffer.write("user_legal_id_type=" + "$_user_legal_id_type" + ", ");
    buffer.write("payment_description=" + "$_payment_description" + ", ");
    buffer.write("financial_institution_code=" + "$_financial_institution_code" + ", ");
    buffer.write("async_payment_url=" + "$_async_payment_url");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Transaction copyWith({String? id, int? amount_in_cents, String? status, String? reference, String? payment_method_type, String? redirect_url, amplify_core.TemporalDateTime? created_at, String? finalized_at, String? customer_email, String? currency, String? status_message, int? user_type, String? user_legal_id, String? user_legal_id_type, String? payment_description, String? financial_institution_code, String? async_payment_url}) {
    return Transaction._internal(
      id: id ?? this.id,
      amount_in_cents: amount_in_cents ?? this.amount_in_cents,
      status: status ?? this.status,
      reference: reference ?? this.reference,
      payment_method_type: payment_method_type ?? this.payment_method_type,
      redirect_url: redirect_url ?? this.redirect_url,
      created_at: created_at ?? this.created_at,
      finalized_at: finalized_at ?? this.finalized_at,
      customer_email: customer_email ?? this.customer_email,
      currency: currency ?? this.currency,
      status_message: status_message ?? this.status_message,
      user_type: user_type ?? this.user_type,
      user_legal_id: user_legal_id ?? this.user_legal_id,
      user_legal_id_type: user_legal_id_type ?? this.user_legal_id_type,
      payment_description: payment_description ?? this.payment_description,
      financial_institution_code: financial_institution_code ?? this.financial_institution_code,
      async_payment_url: async_payment_url ?? this.async_payment_url);
  }
  
  Transaction copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<int>? amount_in_cents,
    ModelFieldValue<String>? status,
    ModelFieldValue<String>? reference,
    ModelFieldValue<String>? payment_method_type,
    ModelFieldValue<String?>? redirect_url,
    ModelFieldValue<amplify_core.TemporalDateTime?>? created_at,
    ModelFieldValue<String?>? finalized_at,
    ModelFieldValue<String?>? customer_email,
    ModelFieldValue<String?>? currency,
    ModelFieldValue<String?>? status_message,
    ModelFieldValue<int?>? user_type,
    ModelFieldValue<String?>? user_legal_id,
    ModelFieldValue<String?>? user_legal_id_type,
    ModelFieldValue<String?>? payment_description,
    ModelFieldValue<String?>? financial_institution_code,
    ModelFieldValue<String?>? async_payment_url
  }) {
    return Transaction._internal(
      id: id == null ? this.id : id.value,
      amount_in_cents: amount_in_cents == null ? this.amount_in_cents : amount_in_cents.value,
      status: status == null ? this.status : status.value,
      reference: reference == null ? this.reference : reference.value,
      payment_method_type: payment_method_type == null ? this.payment_method_type : payment_method_type.value,
      redirect_url: redirect_url == null ? this.redirect_url : redirect_url.value,
      created_at: created_at == null ? this.created_at : created_at.value,
      finalized_at: finalized_at == null ? this.finalized_at : finalized_at.value,
      customer_email: customer_email == null ? this.customer_email : customer_email.value,
      currency: currency == null ? this.currency : currency.value,
      status_message: status_message == null ? this.status_message : status_message.value,
      user_type: user_type == null ? this.user_type : user_type.value,
      user_legal_id: user_legal_id == null ? this.user_legal_id : user_legal_id.value,
      user_legal_id_type: user_legal_id_type == null ? this.user_legal_id_type : user_legal_id_type.value,
      payment_description: payment_description == null ? this.payment_description : payment_description.value,
      financial_institution_code: financial_institution_code == null ? this.financial_institution_code : financial_institution_code.value,
      async_payment_url: async_payment_url == null ? this.async_payment_url : async_payment_url.value
    );
  }
  
  Transaction.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _amount_in_cents = (json['amount_in_cents'] as num?)?.toInt(),
      _status = json['status'],
      _reference = json['reference'],
      _payment_method_type = json['payment_method_type'],
      _redirect_url = json['redirect_url'],
      _created_at = json['created_at'] != null ? amplify_core.TemporalDateTime.fromString(json['created_at']) : null,
      _finalized_at = json['finalized_at'],
      _customer_email = json['customer_email'],
      _currency = json['currency'],
      _status_message = json['status_message'],
      _user_type = (json['user_type'] as num?)?.toInt(),
      _user_legal_id = json['user_legal_id'],
      _user_legal_id_type = json['user_legal_id_type'],
      _payment_description = json['payment_description'],
      _financial_institution_code = json['financial_institution_code'],
      _async_payment_url = json['async_payment_url'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'amount_in_cents': _amount_in_cents, 'status': _status, 'reference': _reference, 'payment_method_type': _payment_method_type, 'redirect_url': _redirect_url, 'created_at': _created_at?.format(), 'finalized_at': _finalized_at, 'customer_email': _customer_email, 'currency': _currency, 'status_message': _status_message, 'user_type': _user_type, 'user_legal_id': _user_legal_id, 'user_legal_id_type': _user_legal_id_type, 'payment_description': _payment_description, 'financial_institution_code': _financial_institution_code, 'async_payment_url': _async_payment_url
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'amount_in_cents': _amount_in_cents,
    'status': _status,
    'reference': _reference,
    'payment_method_type': _payment_method_type,
    'redirect_url': _redirect_url,
    'created_at': _created_at,
    'finalized_at': _finalized_at,
    'customer_email': _customer_email,
    'currency': _currency,
    'status_message': _status_message,
    'user_type': _user_type,
    'user_legal_id': _user_legal_id,
    'user_legal_id_type': _user_legal_id_type,
    'payment_description': _payment_description,
    'financial_institution_code': _financial_institution_code,
    'async_payment_url': _async_payment_url
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Transaction";
    modelSchemaDefinition.pluralName = "Transactions";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'amount_in_cents',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'reference',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'payment_method_type',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'redirect_url',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'created_at',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'finalized_at',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'customer_email',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'currency',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status_message',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'user_type',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'user_legal_id',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'user_legal_id_type',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'payment_description',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'financial_institution_code',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'async_payment_url',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}