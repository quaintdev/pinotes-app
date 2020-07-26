///
//  Generated code. Do not modify.
//  source: note.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'note.pb.dart' as $0;
export 'note.pb.dart';

class NoteServiceClient extends $grpc.Client {
  static final _$saveNote = $grpc.ClientMethod<$0.Note, $0.Response>(
      '/api.NoteService/SaveNote',
      ($0.Note value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$viewNote = $grpc.ClientMethod<$0.Note, $0.Response>(
      '/api.NoteService/ViewNote',
      ($0.Note value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$deleteNote = $grpc.ClientMethod<$0.Note, $0.Response>(
      '/api.NoteService/DeleteNote',
      ($0.Note value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$listNotes = $grpc.ClientMethod<$0.Note, $0.Response>(
      '/api.NoteService/ListNotes',
      ($0.Note value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  NoteServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Response> saveNote($0.Note request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$saveNote, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Response> viewNote($0.Note request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$viewNote, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Response> deleteNote($0.Note request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteNote, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Response> listNotes($0.Note request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$listNotes, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class NoteServiceBase extends $grpc.Service {
  $core.String get $name => 'api.NoteService';

  NoteServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Note, $0.Response>(
        'SaveNote',
        saveNote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Note.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Note, $0.Response>(
        'ViewNote',
        viewNote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Note.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Note, $0.Response>(
        'DeleteNote',
        deleteNote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Note.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Note, $0.Response>(
        'ListNotes',
        listNotes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Note.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> saveNote_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Note> request) async {
    return saveNote(call, await request);
  }

  $async.Future<$0.Response> viewNote_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Note> request) async {
    return viewNote(call, await request);
  }

  $async.Future<$0.Response> deleteNote_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Note> request) async {
    return deleteNote(call, await request);
  }

  $async.Future<$0.Response> listNotes_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Note> request) async {
    return listNotes(call, await request);
  }

  $async.Future<$0.Response> saveNote($grpc.ServiceCall call, $0.Note request);
  $async.Future<$0.Response> viewNote($grpc.ServiceCall call, $0.Note request);
  $async.Future<$0.Response> deleteNote(
      $grpc.ServiceCall call, $0.Note request);
  $async.Future<$0.Response> listNotes($grpc.ServiceCall call, $0.Note request);
}
