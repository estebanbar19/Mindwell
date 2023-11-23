import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:foodfast/data/models/OpenAiCompletitions/Choice.dart';
import 'package:foodfast/data/models/OpenAiCompletitions/Usage.dart';

class CompletitionResponse {

  String id;
  String object;
  int created;
  String model;
  String? systemFingerprint;
  List<Choice> choices;
  Usage usage;


  CompletitionResponse(this.id, this.object, this.created, this.model,
      this.systemFingerprint, this.choices, this.usage);


  CompletitionResponse.name(this.id, this.object, this.created, this.model,
      this.systemFingerprint, this.choices, this.usage);

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getObject() {
    return object;
  }

  void setObject(String object) {
    this.object = object;
  }

  int getCreated() {
    return created;
  }

  void setCreated(int created) {
    this.created = created;
  }

  String getModel() {
    return model;
  }

  void setModel(String model) {
    this.model = model;
  }

  String? getSystemFingerprint() {
    return systemFingerprint;
  }

  void setSystemFingerprint(String systemFingerprint) {
    this.systemFingerprint = systemFingerprint;
  }

  List<Choice> getChoices() {
    return choices;
  }

  void setChoices(List<Choice> choices) {
    this.choices = choices;
  }

  Usage getUsage() {
    return usage;
  }

  void setUsage(Usage usage) {
    this.usage = usage;
  }

  factory CompletitionResponse.fromJson(Map<String, dynamic> json) {
    return CompletitionResponse(json['id'], json['object'], json['created'], json['model'], json['systemFingerprint'], (json['choices'] as List).map((choiceJson) => Choice.fromJson(choiceJson)).toList(), Usage.fromJson(json['usage']));
  }

}