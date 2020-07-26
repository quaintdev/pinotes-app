import 'package:pinotes/api/grpc/note.pbgrpc.dart';
import 'package:pinotes/api/grpcClient.dart';

class NoteService {
  static Future<Response> saveNote(Note note) async {
    var client = NoteServiceClient(GRPCFlutterClient.getClient());
    return await client.saveNote(note);
  }

  static Future<Response> deleteNote(Note note) async {
    var client = NoteServiceClient(GRPCFlutterClient.getClient());
    return await client.deleteNote(note);
  }

  static Future<Response> viewNote(Note note) async {
    var client = NoteServiceClient(GRPCFlutterClient.getClient());
    return await client.viewNote(note);
  }

  static Future<Response> listNotes() async {
    var client = NoteServiceClient(GRPCFlutterClient.getClient());
    Note note = Note.create();
    note.user = "rohan";
    return await client.listNotes(note);
  }
}
