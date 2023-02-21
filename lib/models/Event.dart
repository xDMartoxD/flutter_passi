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
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Event type in your schema. */
@immutable
class Event extends Model {
  static const classType = const _EventModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _company;
  final String? _companyUrl;
  final TemporalDate? _startDate;
  final TemporalTime? _startTime;
  final TemporalDateTime? _startDateTime;
  final TemporalDate? _finishDate;
  final TemporalTime? _finishTime;
  final TemporalDateTime? _finishDateTime;
  final String? _yearMonth;
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
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final int? _maxBuyQuantity;
  final List<TicketCategory>? _ticketCategories;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get companyUrl {
    return _companyUrl;
  }
  
  TemporalDate get startDate {
    try {
      return _startDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalTime get startTime {
    try {
      return _startTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime get startDateTime {
    try {
      return _startDateTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get finishDate {
    try {
      return _finishDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalTime get finishTime {
    try {
      return _finishTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime get finishDateTime {
    try {
      return _finishDateTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get yearMonth {
    try {
      return _yearMonth!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Coordinates get coords {
    try {
      return _coords!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get address {
    try {
      return _address!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get maxCapacity {
    try {
      return _maxCapacity!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get totalAssistants {
    try {
      return _totalAssistants!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get primaryImage {
    try {
      return _primaryImage!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
  
  EventCategory get eventCategory {
    try {
      return _eventCategory!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime get updatedAt {
    try {
      return _updatedAt!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
  
  const Event._internal({required this.id, required title, description, required company, companyUrl, required startDate, required startTime, required startDateTime, required finishDate, required finishTime, required finishDateTime, required yearMonth, required coords, required address, place, minAge, required price, required maxCapacity, required totalAssistants, required primaryImage, contactNumber, images, required eventCategory, tickets, Jobs, discountCodes, needsCode, required createdAt, required updatedAt, maxBuyQuantity, ticketCategories}): _title = title, _description = description, _company = company, _companyUrl = companyUrl, _startDate = startDate, _startTime = startTime, _startDateTime = startDateTime, _finishDate = finishDate, _finishTime = finishTime, _finishDateTime = finishDateTime, _yearMonth = yearMonth, _coords = coords, _address = address, _place = place, _minAge = minAge, _price = price, _maxCapacity = maxCapacity, _totalAssistants = totalAssistants, _primaryImage = primaryImage, _contactNumber = contactNumber, _images = images, _eventCategory = eventCategory, _tickets = tickets, _Jobs = Jobs, _discountCodes = discountCodes, _needsCode = needsCode, _createdAt = createdAt, _updatedAt = updatedAt, _maxBuyQuantity = maxBuyQuantity, _ticketCategories = ticketCategories;
  
  factory Event({String? id, required String title, String? description, required String company, String? companyUrl, required TemporalDate startDate, required TemporalTime startTime, required TemporalDateTime startDateTime, required TemporalDate finishDate, required TemporalTime finishTime, required TemporalDateTime finishDateTime, required String yearMonth, required Coordinates coords, required String address, String? place, int? minAge, required double price, required int maxCapacity, required int totalAssistants, required String primaryImage, String? contactNumber, List<String>? images, required EventCategory eventCategory, List<Ticket>? tickets, List<Job>? Jobs, List<DiscountCode>? discountCodes, bool? needsCode, required TemporalDateTime createdAt, required TemporalDateTime updatedAt, int? maxBuyQuantity, List<TicketCategory>? ticketCategories}) {
    return Event._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      description: description,
      company: company,
      companyUrl: companyUrl,
      startDate: startDate,
      startTime: startTime,
      startDateTime: startDateTime,
      finishDate: finishDate,
      finishTime: finishTime,
      finishDateTime: finishDateTime,
      yearMonth: yearMonth,
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
      _startDate == other._startDate &&
      _startTime == other._startTime &&
      _startDateTime == other._startDateTime &&
      _finishDate == other._finishDate &&
      _finishTime == other._finishTime &&
      _finishDateTime == other._finishDateTime &&
      _yearMonth == other._yearMonth &&
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
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("startTime=" + (_startTime != null ? _startTime!.format() : "null") + ", ");
    buffer.write("startDateTime=" + (_startDateTime != null ? _startDateTime!.format() : "null") + ", ");
    buffer.write("finishDate=" + (_finishDate != null ? _finishDate!.format() : "null") + ", ");
    buffer.write("finishTime=" + (_finishTime != null ? _finishTime!.format() : "null") + ", ");
    buffer.write("finishDateTime=" + (_finishDateTime != null ? _finishDateTime!.format() : "null") + ", ");
    buffer.write("yearMonth=" + "$_yearMonth" + ", ");
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
  
  Event copyWith({String? id, String? title, String? description, String? company, String? companyUrl, TemporalDate? startDate, TemporalTime? startTime, TemporalDateTime? startDateTime, TemporalDate? finishDate, TemporalTime? finishTime, TemporalDateTime? finishDateTime, String? yearMonth, Coordinates? coords, String? address, String? place, int? minAge, double? price, int? maxCapacity, int? totalAssistants, String? primaryImage, String? contactNumber, List<String>? images, EventCategory? eventCategory, List<Ticket>? tickets, List<Job>? Jobs, List<DiscountCode>? discountCodes, bool? needsCode, TemporalDateTime? createdAt, TemporalDateTime? updatedAt, int? maxBuyQuantity, List<TicketCategory>? ticketCategories}) {
    return Event._internal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      company: company ?? this.company,
      companyUrl: companyUrl ?? this.companyUrl,
      startDate: startDate ?? this.startDate,
      startTime: startTime ?? this.startTime,
      startDateTime: startDateTime ?? this.startDateTime,
      finishDate: finishDate ?? this.finishDate,
      finishTime: finishTime ?? this.finishTime,
      finishDateTime: finishDateTime ?? this.finishDateTime,
      yearMonth: yearMonth ?? this.yearMonth,
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
  
  Event.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _company = json['company'],
      _companyUrl = json['companyUrl'],
      _startDate = json['startDate'] != null ? TemporalDate.fromString(json['startDate']) : null,
      _startTime = json['startTime'] != null ? TemporalTime.fromString(json['startTime']) : null,
      _startDateTime = json['startDateTime'] != null ? TemporalDateTime.fromString(json['startDateTime']) : null,
      _finishDate = json['finishDate'] != null ? TemporalDate.fromString(json['finishDate']) : null,
      _finishTime = json['finishTime'] != null ? TemporalTime.fromString(json['finishTime']) : null,
      _finishDateTime = json['finishDateTime'] != null ? TemporalDateTime.fromString(json['finishDateTime']) : null,
      _yearMonth = json['yearMonth'],
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
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _maxBuyQuantity = (json['maxBuyQuantity'] as num?)?.toInt(),
      _ticketCategories = json['ticketCategories'] is List
        ? (json['ticketCategories'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TicketCategory.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'company': _company, 'companyUrl': _companyUrl, 'startDate': _startDate?.format(), 'startTime': _startTime?.format(), 'startDateTime': _startDateTime?.format(), 'finishDate': _finishDate?.format(), 'finishTime': _finishTime?.format(), 'finishDateTime': _finishDateTime?.format(), 'yearMonth': _yearMonth, 'coords': _coords?.toJson(), 'address': _address, 'place': _place, 'minAge': _minAge, 'price': _price, 'maxCapacity': _maxCapacity, 'totalAssistants': _totalAssistants, 'primaryImage': _primaryImage, 'contactNumber': _contactNumber, 'images': _images, 'eventCategory': _eventCategory?.toJson(), 'tickets': _tickets?.map((Ticket? e) => e?.toJson()).toList(), 'Jobs': _Jobs?.map((Job? e) => e?.toJson()).toList(), 'discountCodes': _discountCodes?.map((DiscountCode? e) => e?.toJson()).toList(), 'needsCode': _needsCode, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'maxBuyQuantity': _maxBuyQuantity, 'ticketCategories': _ticketCategories?.map((TicketCategory? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'title': _title, 'description': _description, 'company': _company, 'companyUrl': _companyUrl, 'startDate': _startDate, 'startTime': _startTime, 'startDateTime': _startDateTime, 'finishDate': _finishDate, 'finishTime': _finishTime, 'finishDateTime': _finishDateTime, 'yearMonth': _yearMonth, 'coords': _coords, 'address': _address, 'place': _place, 'minAge': _minAge, 'price': _price, 'maxCapacity': _maxCapacity, 'totalAssistants': _totalAssistants, 'primaryImage': _primaryImage, 'contactNumber': _contactNumber, 'images': _images, 'eventCategory': _eventCategory, 'tickets': _tickets, 'Jobs': _Jobs, 'discountCodes': _discountCodes, 'needsCode': _needsCode, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'maxBuyQuantity': _maxBuyQuantity, 'ticketCategories': _ticketCategories
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField COMPANY = QueryField(fieldName: "company");
  static final QueryField COMPANYURL = QueryField(fieldName: "companyUrl");
  static final QueryField STARTDATE = QueryField(fieldName: "startDate");
  static final QueryField STARTTIME = QueryField(fieldName: "startTime");
  static final QueryField STARTDATETIME = QueryField(fieldName: "startDateTime");
  static final QueryField FINISHDATE = QueryField(fieldName: "finishDate");
  static final QueryField FINISHTIME = QueryField(fieldName: "finishTime");
  static final QueryField FINISHDATETIME = QueryField(fieldName: "finishDateTime");
  static final QueryField YEARMONTH = QueryField(fieldName: "yearMonth");
  static final QueryField COORDS = QueryField(fieldName: "coords");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField PLACE = QueryField(fieldName: "place");
  static final QueryField MINAGE = QueryField(fieldName: "minAge");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField MAXCAPACITY = QueryField(fieldName: "maxCapacity");
  static final QueryField TOTALASSISTANTS = QueryField(fieldName: "totalAssistants");
  static final QueryField PRIMARYIMAGE = QueryField(fieldName: "primaryImage");
  static final QueryField CONTACTNUMBER = QueryField(fieldName: "contactNumber");
  static final QueryField IMAGES = QueryField(fieldName: "images");
  static final QueryField EVENTCATEGORY = QueryField(
    fieldName: "eventCategory",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'EventCategory'));
  static final QueryField TICKETS = QueryField(
    fieldName: "tickets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Ticket'));
  static final QueryField JOBS = QueryField(
    fieldName: "Jobs",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Job'));
  static final QueryField DISCOUNTCODES = QueryField(
    fieldName: "discountCodes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'DiscountCode'));
  static final QueryField NEEDSCODE = QueryField(fieldName: "needsCode");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField UPDATEDAT = QueryField(fieldName: "updatedAt");
  static final QueryField MAXBUYQUANTITY = QueryField(fieldName: "maxBuyQuantity");
  static final QueryField TICKETCATEGORIES = QueryField(
    fieldName: "ticketCategories",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'TicketCategory'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Event";
    modelSchemaDefinition.pluralName = "Events";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "Admin" ],
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ]),
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["id"], name: null),
      ModelIndex(fields: const ["yearMonth", "startDate"], name: "byYearMonth"),
      ModelIndex(fields: const ["eventcategoryID", "startDate", "startTime"], name: "byEventCategory")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.COMPANY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.COMPANYURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.STARTDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.STARTTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.STARTDATETIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.FINISHDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.FINISHTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.FINISHDATETIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.YEARMONTH,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'coords',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Coordinates')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.ADDRESS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.PLACE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.MINAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.MAXCAPACITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.TOTALASSISTANTS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.PRIMARYIMAGE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.CONTACTNUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.IMAGES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Event.EVENTCATEGORY,
      isRequired: true,
      targetName: 'eventcategoryID',
      ofModelName: 'EventCategory'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Event.TICKETS,
      isRequired: true,
      ofModelName: 'Ticket',
      associatedKey: Ticket.EVENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Event.JOBS,
      isRequired: true,
      ofModelName: 'Job',
      associatedKey: Job.EVENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Event.DISCOUNTCODES,
      isRequired: true,
      ofModelName: 'DiscountCode',
      associatedKey: DiscountCode.EVENT
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.NEEDSCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.CREATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.UPDATEDAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Event.MAXBUYQUANTITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Event.TICKETCATEGORIES,
      isRequired: true,
      ofModelName: 'TicketCategory',
      associatedKey: TicketCategory.EVENT
    ));
  });
}

class _EventModelType extends ModelType<Event> {
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