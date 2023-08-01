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

import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'DiscountCode.dart';
import 'Event.dart';
import 'EventCategory.dart';
import 'Job.dart';
import 'PaymentMethod.dart';
import 'Ticket.dart';
import 'TicketCategory.dart';
import 'User.dart';
import 'Coordinates.dart';
import 'CreateEntranceResponse.dart';
import 'FinancialInstitution.dart';
import 'FinancialInstitutionResponse.dart';
import 'Merchant.dart';
import 'PaymentMethodData.dart';
import 'PresignedAcceptance.dart';
import 'S3Object.dart';
import 'TokenCardRes.dart';
import 'TokenCardResData.dart';
import 'TokenNequiRes.dart';
import 'TokenNequiResData.dart';
import 'Transaction.dart';

export 'BrandEnum.dart';
export 'Coordinates.dart';
export 'CreateEntranceResponse.dart';
export 'CurrenciesEnum.dart';
export 'DiscountCode.dart';
export 'Event.dart';
export 'EventCategory.dart';
export 'FinancialInstitution.dart';
export 'FinancialInstitutionResponse.dart';
export 'Job.dart';
export 'JobType.dart';
export 'Merchant.dart';
export 'PaymentMethod.dart';
export 'PaymentMethodData.dart';
export 'PaymentMethodEnum.dart';
export 'PresignedAcceptance.dart';
export 'S3Object.dart';
export 'Ticket.dart';
export 'TicketCategory.dart';
export 'TokenCardRes.dart';
export 'TokenCardResData.dart';
export 'TokenNequiRes.dart';
export 'TokenNequiResData.dart';
export 'Transaction.dart';
export 'User.dart';

class ModelProvider implements amplify_core.ModelProviderInterface {
  @override
  String version = "430ab49efde2d480b49c7b1db22affc1";
  @override
  List<amplify_core.ModelSchema> modelSchemas = [DiscountCode.schema, Event.schema, EventCategory.schema, Job.schema, PaymentMethod.schema, Ticket.schema, TicketCategory.schema, User.schema];
  @override
  List<amplify_core.ModelSchema> customTypeSchemas = [Coordinates.schema, CreateEntranceResponse.schema, FinancialInstitution.schema, FinancialInstitutionResponse.schema, Merchant.schema, PaymentMethodData.schema, PresignedAcceptance.schema, S3Object.schema, TokenCardRes.schema, TokenCardResData.schema, TokenNequiRes.schema, TokenNequiResData.schema, Transaction.schema];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  amplify_core.ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "DiscountCode":
        return DiscountCode.classType;
      case "Event":
        return Event.classType;
      case "EventCategory":
        return EventCategory.classType;
      case "Job":
        return Job.classType;
      case "PaymentMethod":
        return PaymentMethod.classType;
      case "Ticket":
        return Ticket.classType;
      case "TicketCategory":
        return TicketCategory.classType;
      case "User":
        return User.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}


class ModelFieldValue<T> {
  const ModelFieldValue.value(this.value);

  final T value;
}
