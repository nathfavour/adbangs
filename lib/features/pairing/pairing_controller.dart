import '../../services/connection_service.dart';

class PairingController {
  final ConnectionService connectionService;

  PairingController(this.connectionService);

  Future<void> pairWithCode(String code) async {
    try {
      await connectionService.pairWithCode(code);
      connectionService.logInfo('Pairing successful with code: $code');
      // Optionally, notify the UI about successful pairing
    } catch (e) {
      connectionService.logError('Pairing failed: $e');
      // Optionally, notify the UI about the error
    }
  }
}
