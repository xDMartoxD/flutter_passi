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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Event type in your schema. */
class Event extends amplify_core.Model {
  static const classType = const _EventModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _company;
  final String? _companyUrl;
  final amplify_core.TemporalDateTime? _startDateTime;
  final amplify_core.TemporalDateTime? _finishDateTime;
  final Coordinates? _coords;
  final String? _address;
  final String? _place;
  final int? _minAge;
  final double? _price;
  final int? _maxCapacity;
  final int? _totalAssistants;
  final String? _primaryImage;
  final String? _contactNumber;
  final List<String>? _images;
  final EventCategory? _eventCategory;
  final List<Ticket>? _tickets;
  final List<Job>? _Jobs;
  final List<DiscountCode>? _discountCodes;
  final bool? _needsCode;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final int? _maxBuyQuantity;
  final List<TicketCategory>? _ticketCategories;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventModelIdentifier get modelIdentifier {
      return EventModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
  }
  
  String get company {
    try {
      return _company!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get companyUrl {
    return _companyUrl;
  }
  
  amplify_core.TemporalDateTime get startDateTime {
    try {
      return _startDateTime!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get finishDateTime {
    try {
      return _finishDateTime!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Coordinates? get coords {
    return _coords;
  }
  
  String get address {
    try {
      return _address!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get place {
    return _place;
  }
  
  int? get minAge {
    return _minAge;
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get maxCapacity {
    try {
      return _maxCapacity!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get totalAssistants {
    try {
      return _totalAssistants!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get primaryImage {
    try {
      return _primaryImage!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get contactNumber {
    return _contactNumber;
  }
  
  List<String>? get images {
    return _images;
  }
  
  EventCategory? get eventCategory {
    return _eventCategory;
  }
  
  List<Ticket>? get tickets {
    return _tickets;
  }
  
  List<Job>? get Jobs {
    return _Jobs;
  }
  
  List<DiscountCode>? get discountCodes {
    return _discountCodes;
  }
  
  bool? get needsCode {
    return _needsCode;
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
  
  int? get maxBuyQuantity {
    return _maxBuyQuantity;
  }
  
  List<TicketCategory>? get ticketCategories {
    return _ticketCategories;
  }
  
  const Event._internal({required this.id, required title, description, required company, companyUrl, required startDateTime, required finishDateTime, coords, required address, place, minAge, required price, required maxCapacity, required totalAssistants, required primaryImage, contactNumber, images, eventCategory, tickets, Jobs, discountCodes, needsCode, required createdAt, required updatedAt, maxBuyQuantity, ticketCategories}): _title = title, _description = description, _company = company, _companyUrl = companyUrl, _startDateTime = startDateTime, _finishDateTime = finishDateTime, _coords = coords, _address = address, _place = place, _minAge = minAge, _price = price, _maxCapacity = maxCapacity, _totalAssistants = totalAssistants, _primaryImage = primaryImage, _contactNumber = contactNumber, _images = images, _eventCategory = eventCategory, _tickets = tickets, _Jobs = Jobs, _discountCodes = discountCodes, _needsCode = needsCode, _createdAt = createdAt, _updatedAt = updatedAt, _maxBuyQuantity = maxBuyQuantity, _ticketCategories = ticketCategories;
  
  factory Event({String? id, required String title, String? description, required String company, String? companyUrl, required amplify_core.TemporalDateTime startDateTime, required amplify_core.TemporalDateTime finishDateTime, Coordinates? coords, required String address, String? place, int? minAge, required double price, required int maxCapacity, required int totalAssistants, required String primaryImage, String? contactNumber, List<String>? images, EventCategory? eventCategory, List<Ticket>? tickets, List<Job>? Jobs, List<DiscountCode>? discountCodes, bool? needsCode, required amplify_core.TemporalDateTime createdAt, required amplify_core.TemporalDateTime updatedAt, int? maxBuyQuantity, List<TicketCategory>? ticketCategories}) {
    return Event._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      description: description,
      company: company,
      companyUrl: companyUrl,
      startDateTime: startDateTime,
      finishDateTime: finishDateTime,
      coords: coords,
      address: address,
      place: place,
      minAge: minAge,
      price: price,
      maxCapacity: maxCapacity,
      totalAssistants: totalAssistants,
      primaryImage: primaryImage,
      contactNumber: contactNumber,
      images: images != null ? List<String>.unmodifiable(images) : images,
      eventCategory: eventCategory,
      tickets: tickets != null ? List<Ticket>.unmodifiable(tickets) : tickets,
      Jobs: Jobs != null ? List<Job>.unmodifiable(Jobs) : Jobs,
      discountCodes: discountCodes != null ? List<DiscountCode>.unmodifiable(discountCodes) : discountCodes,
      needsCode: needsCode,
      createdAt: createdAt,
      updatedAt: updatedAt,
      maxBuyQuantity: maxBuyQuantity,
      ticketCategories: ticketCategories != null ? List<TicketCategory>.unmodifiable(ticketCategories) : ticketCategories);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _company == other._company &&
      _companyUrl == other._companyUrl &&
      _startDateTime == other._startDateTime &&
      _finishDateTime == other._finishDateTime &&
      _coords == other._coords &&
      _address == other._address &&
      _place == other._place &&
      _minAge == other._minAge &&
      _price == other._price &&
      _maxCapacity == other._maxCapacity &&
      _totalAssistants == other._totalAssistants &&
      _primaryImage == other._primaryImage &&
      _contactNumber == other._contactNumber &&
      DeepCollectionEquality().equals(_images, other._images) &&
      _eventCategory == other._eventCategory &&
      DeepCollectionEquality().equals(_tickets, other._tickets) &&
      DeepCollectionEquality().equals(_Jobs, other._Jobs) &&
      DeepCollectionEquality().equals(_discountCodes, other._discountCodes) &&
      _needsCode == other._needsCode &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _maxBuyQuantity == other._maxBuyQuantity &&
      DeepCollectionEquality().equals(_ticketCategories, other._ticketCategories);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Event {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("company=" + "$_company" + ", ");
    buffer.write("companyUrl=" + "$_companyUrl" + ", ");
    buffer.write("startDateTime=" + (_startDateTime != null ? _startDateTime!.format() : "null") + ", ");
    buffer.write("finishDateTime=" + (_finishDateTime != null ? _finishDateTime!.format() : "null") + ", ");
    buffer.write("coords=" + (_coords != null ? _coords!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("place=" + "$_place" + ", ");
    buffer.write("minAge=" + (_minAge != null ? _minAge!.toString() : "null") + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("maxCapacity=" + (_maxCapacity != null ? _maxCapacity!.toString() : "null") + ", ");
    buffer.write("totalAssistants=" + (_totalAssistants != null ? _totalAssistants!.toString() : "null") + ", ");
    buffer.write("primaryImage=" + "$_primaryImage" + ", ");
    buffer.write("contactNumber=" + "$_contactNumber" + ", ");
    buffer.write("images=" + (_images != null ? _images!.toString() : "null") + ", ");
    buffer.write("eventCategory=" + (_eventCategory != null ? _eventCategory!.toString() : "null") + ", ");
    buffer.write("needsCode=" + (_needsCode != null ? _needsCode!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("maxBuyQuantity=" + (_maxBuyQuantity != null ? _maxBuyQuantity!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Event copyWith({String? title, String? description, String? company, String? companyUrl, amplify_core.TemporalDateTime? startDateTime, amplify_core.TemporalDateTime? finishDateTime, Coordinates? coords, String? address, String? place, int? minAge, double? price, int? maxCapacity, int? totalAssistants, String? primaryImage, String? contactNumber, List<String>? images, EventCategory? eventCategory, List<Ticket>? tickets, List<Job>? Jobs, List<DiscountCode>? discountCodes, bool? needsCode, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, int? maxBuyQuantity, List<TicketCategory>? ticketCategories}) {
    return Event._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      company: company ?? this.company,
      companyUrl: companyUrl ?? this.companyUrl,
      startDateTime: startDateTime ?? this.startDateTime,
      finishDateTime: finishDateTime ?? this.finishDateTime,
      coords: coords ?? this.coords,
      address: address ?? this.address,
      place: place ?? this.place,
      minAge: minAge ?? this.minAge,
      price: price ?? this.price,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      totalAssistants: totalAssistants ?? this.totalAssistants,
      primaryImage: primaryImage ?? this.primaryImage,
      contactNumber: contactNumber ?? this.contactNumber,
      images: images ?? this.images,
      eventCategory: eventCategory ?? this.eventCategory,
      tickets: tickets ?? this.tickets,
      Jobs: Jobs ?? this.Jobs,
      discountCodes: discountCodes ?? this.discountCodes,
      needsCode: needsCode ?? this.needsCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      maxBuyQuantity: maxBuyQuantity ?? this.maxBuyQuantity,
      ticketCategories: ticketCategories ?? this.ticketCategories);
  }
  
  Event copyWithModelFieldValues({
    ModelFieldValue<String>? title,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String>? company,
    ModelFieldValue<String?>? companyUrl,
    ModelFieldValue<amplify_core.TemporalDateTime>? startDateTime,
    ModelFieldValue<amplify_core.TemporalDateTime>? finishDateTime,
    ModelFieldValue<Coordinates?>? coords,
    ModelFieldValue<String>? address,
    ModelFieldValue<String?>? place,
    ModelFieldValue<int?>? minAge,
    ModelFieldValue<double>? price,
    ModelFieldValue<int>? maxCapacity,
    ModelFieldValue<int>? totalAssistants,
    ModelFieldValue<String>? primaryImage,
    ModelFieldValue<String?>? contactNumber,
    ModelFieldValue<List<String>>? images,
    ModelFieldValue<EventCategory?>? eventCategory,
    ModelFieldValue<List<Ticket>?>? tickets,
    ModelFieldValue<List<Job>?>? Jobs,
    ModelFieldValue<List<DiscountCode>?>? discountCodes,
    ModelFieldValue<bool?>? needsCode,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime>? updatedAt,
    ModelFieldValue<int?>? maxBuyQuantity,
    ModelFieldValue<List<TicketCategory>?>? ticketCategories
  }) {
    return Event._internal(
      id: id,
      title: title == null ? this.title : title.value,
      description: description == null ? this.description : description.value,
      company: company == null ? this.company : company.value,
      companyUrl: companyUrl == null ? this.companyUrl : companyUrl.value,
      startDateTime: startDateTime == null ? this.startDateTime : startDateTime.value,
      finishDateTime: finishDateTime == null ? this.finishDateTime : finishDateTime.value,
      coords: coords == null ? this.coords : coords.value,
      address: address == null ? this.address : address.value,
      place: place == null ? this.place : place.value,
      minAge: minAge == null ? this.minAge : minAge.value,
      price: price == null ? this.price : price.value,
      maxCapacity: maxCapacity == null ? this.maxCapacity : maxCapacity.value,
      totalAssistants: totalAssistants == null ? this.totalAssistants : totalAssistants.value,
      primaryImage: primaryImage == null ? this.primaryImage : primaryImage.value,
      contactNumber: contactNumber == null ? this.contactNumber : contactNumber.value,
      images: images == null ? this.images : images.value,
      eventCategory: eventCategory == null ? this.eventCategory : eventCategory.value,
      tickets: tickets == null ? this.tickets : tickets.value,
      Jobs: Jobs == null ? this.Jobs : Jobs.value,
      discountCodes: discountCodes == null ? this.discountCodes : discountCodes.value,
      needsCode: needsCode == null ? this.needsCode : needsCode.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      maxBuyQuantity: maxBuyQuantity == null ? this.maxBuyQuantity : maxBuyQuantity.value,
      ticketCategories: ticketCategories == null ? this.ticketCategories : ticketCategories.value
    );
  }
  
  Event.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _company = json['company'],
      _companyUrl = json['companyUrl'],
      _startDateTime = json['startDateTime'] != null ? amplify_core.TemporalDateTime.fromString(json['startDateTime']) : null,
      _finishDateTime = json['finishDateTime'] != null ? amplify_core.TemporalDateTime.fromString(json['finishDateTime']) : null,
      _coords = json['coords']?['serializedData'] != null
        ? Coordinates.fromJson(new Map<String, dynamic>.from(json['coords']['serializedData']))
        : null,
      _address = json['address'],
      _place = json['place'],
      _minAge = (json['minAge'] as num?)?.toInt(),
      _price = (json['price'] as num?)?.toDouble(),
      _maxCapacity = (json['maxCapacity'] as num?)?.toInt(),
      _totalAssistants = (json['totalAssistants'] as num?)?.toInt(),
      _primaryImage = json['primaryImage'],
      _contactNumber = json['contactNumber'],
      _images = json['images']?.cast<String>(),
      _eventCategory = json['eventCategory']?['serializedData'] != null
        ? EventCategory.fromJson(new Map<String, dynamic>.from(json['eventCategory']['serializedData']))
        : null,
      _tickets = json['tickets'] is List
        ? (json['tickets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Ticket.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _Jobs = json['Jobs'] is List
        ? (json['Jobs'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Job.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _discountCodes = json['discountCodes'] is List
        ? (json['discountCodes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => DiscountCode.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _needsCode = json['needsCode'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _maxBuyQuantity = (json['maxBuyQuantity'] as num?)?.toInt(),
      _ticketCategories = json['ticketCategories'] is List
        ? (json['ticketCategories'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TicketCategory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'company': _company, 'companyUrl': _companyUrl, 'startDateTime': _startDateTime?.format(), 'finishDateTime': _finishDateTime?.format(), 'coords': _coords?.toJson(), 'address': _address, 'place': _place, 'minAge': _minAge, 'price': _price, 'maxCapacity': _maxCapacity, 'totalAssistants': _totalAssistants, 'primaryImage': _primaryImage, 'contactNumber': _contactNumber, 'images': _images, 'eventCategory': _eventCategory?.toJson(), 'tickets': _tickets?.map((Ticket? e) => e?.toJson()).toList(), 'Jobs': _Jobs?.map((Job? e) => e?.toJson()).toList(), 'discountCodes': _discountCodes?.map((DiscountCode? e) => e?.toJson()).toList(), 'needsCode': _needsCode, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'maxBuyQuantity': _maxBuyQuantity, 'ticketCategories': _ticketCategories?.map((TicketCategory? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'description': _description,
    'company': _company,
    'companyUrl': _companyUrl,
    'startDateTime': _startDateTime,
    'finishDateTime': _finishDateTime,
    'coords': _coords,
    'address': _address,
    'place': _place,
    'minAge': _minAge,
    'price': _price,
    'maxCapacity': _maxCapacity,
    'totalAssistants': _totalAssistants,
    'primaryImage': _primaryImage,
    'contactNumber': _contactNumber,
    'images': _images,
    'eventCategory': _eventCategory,
    'tickets': _tickets,
    'Jobs': _Jobs,
    'discountCodes': _discountCodes,
    'needsCode': _needsCode,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'maxBuyQuantity': _maxBuyQuantity,
    'ticketCategories': _ticketCategories
  };

  static final amplify_core.QueryModelIdentifier<EventModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final COMPANY = amplify_core.QueryField(fieldName: "company");
  static final COMPANYURL = amplify_core.QueryField(fieldName: "companyUrl");
  static final STARTDATETIME = amplify_core.QueryField(fieldName: "startDateTime");
  static final FINISHDATETIME = amplify_core.QueryField(fieldName: "finishDateTime");
  static final COORDS = amplify_core.QueryField(fieldName: "coords");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final PLACE = amplify_core.QueryField(fieldName: "place");
  static final MINAGE = amplify_core.QueryField(fieldName: "minAge");
  static final PRICE = amplify_core.QueryField(fieldName: "price");
  static final MAXCAPACITY = amplify_core.QueryField(fieldName: "maxCapacity");
  static final TOTALASSISTANTS = amplify_core.QueryField(fieldName: "totalAssistants");
  static final PRIMARYIMAGE = amplify_core.QueryField(fieldName: "primaryImage");
  static final CONTACTNUMBER = amplify_core.QueryField(fieldName: "contactNumber");
  static final IMAGES = amplify_core.QueryField(fieldName: "images");
  static final EVENTCATEGORY = amplify_core.QueryField(
    fieldName: "eventCategory",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventCategory'));
  static final TICKETS = amplify_core.QueryField(
    fieldName: "tickets",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final JOBS = amplify_core.QueryField(
    fieldName: "Jobs",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Job'));
  static final DISCOUNTCODES = amplify_core.QueryField(
    fieldName: "discountCodes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'DiscountCode'));
  static final NEEDSCODE = amplify_core.QueryField(fieldName: "needsCode");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final MAXBUYQUANTITY = amplify_core.QueryField(fieldName: "maxBuyQuantity");
  static final TICKETCATEGORIES = amplify_core.QueryField(
    fieldName: "ticketCategories",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'TicketCategory'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Event";
    modelSchemaDefinition.pluralName = "Events";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
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
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null),
      amplify_core.ModelIndex(fields: const ["eventcategoryID", "startDateTime"], name: "byEventCategory")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.TITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.COMPANY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.COMPANYURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.STARTDATETIME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.FINISHDATETIME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'coords',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Coordinates')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.ADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.PLACE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.MINAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.PRICE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.MAXCAPACITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.TOTALASSISTANTS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.PRIMARYIMAGE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.CONTACTNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.IMAGES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Event.EVENTCATEGORY,
      isRequired: false,
      targetNames: ['eventcategoryID'],
      ofModelName: 'EventCategory'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Event.TICKETS,
      isRequired: false,
      ofModelName: 'Ticket',
      associatedKey: Ticket.EVENT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Event.JOBS,
      isRequired: false,
      ofModelName: 'Job',
      associatedKey: Job.EVENT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Event.DISCOUNTCODES,
      isRequired: false,
      ofModelName: 'DiscountCode',
      associatedKey: DiscountCode.EVENTID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.NEEDSCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.CREATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.UPDATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.MAXBUYQUANTITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Event.TICKETCATEGORIES,
      isRequired: false,
      ofModelName: 'TicketCategory',
      associatedKey: TicketCategory.EVENT
    ));
  });
}

class _EventModelType extends amplify_core.ModelType<Event> {
  const _EventModelType();
  
  @override
  Event fromJson(Map<String, dynamic> jsonData) {
    return Event.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Event';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Event] in your schema.
 */
class EventModelIdentifier implements amplify_core.ModelIdentifier<Event> {
  final String id;

  /** Create an instance of EventModelIdentifier using [id] the primary key. */
  const EventModelIdentifier({
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
  String toString() => 'EventModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}