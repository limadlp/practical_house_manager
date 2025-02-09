import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:practical_house_manager/app/core/http/http_client.dart';
import 'package:web_socket_channel/io.dart';
import '../models/shop_list.dart';
import '../models/shop_list_update.dart'; // Novo modelo
import 'shoplist_repository.dart';

class ShopListRepositoryImpl implements ShopListRepository {
  final HttpClient _client = HttpClient();
  IOWebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Function(ShopListUpdate)? _onUpdate; // Callback para o Store
  int _retryCount = 0;

  @override
  Future<List<ShopList>> getAllLists() async {
    try {
      final response = await _client.get('/lists');
      return (response.data as List)
          .map((json) => ShopList.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Erro ao buscar listas: $e");
    }
  }

  @override
  Future<ShopList> getListById(String listId) async {
    try {
      final response = await _client.get('/lists/$listId');
      return ShopList.fromJson(response.data);
    } catch (e) {
      throw Exception("Erro ao buscar lista: $e");
    }
  }

  @override
  Future<void> addItemToList(String listId, Map<String, dynamic> item) async {
    try {
      await _client.post('/lists/$listId/items', data: item);
    } catch (e) {
      throw Exception("Erro ao adicionar item: $e");
    }
  }

  @override
  Future<void> updateItemInList(
      String listId, String itemId, Map<String, dynamic> item) async {
    try {
      await _client.put('/lists/$listId/items/$itemId', data: item);
    } catch (e) {
      throw Exception("Erro ao atualizar item: $e");
    }
  }

  @override
  Future<void> deleteItemFromList(String listId, String itemId) async {
    try {
      await _client.delete('/lists/$listId/items/$itemId');
    } catch (e) {
      throw Exception("Erro ao remover item: $e");
    }
  }

  @override
  void listenToListsUpdates(Function(ShopListUpdate) onUpdate) {
    _onUpdate = onUpdate; // Armazena a função de callback
    _connectWebSocket();
  }

  void _connectWebSocket() {
    _channel = IOWebSocketChannel.connect(
      "ws://localhost:8080/ws",
      pingInterval: Duration(seconds: 30),
    );

    _subscription = _channel!.stream
        .timeout(Duration(seconds: 45))
        .listen(_handleMessage, onError: (error) {
      print("Erro no WebSocket: $error");
      _scheduleReconnect();
    }, onDone: () {
      print("WebSocket desconectado");
      _scheduleReconnect();
    });
  }

  void _handleMessage(dynamic message) {
    try {
      final update = ShopListUpdate.fromJson(jsonDecode(message));
      _onUpdate?.call(update);
    } catch (e) {
      print("Erro ao processar WebSocket: $e");
    }
  }

  void _scheduleReconnect() {
    _retryCount++;
    Future.delayed(Duration(seconds: pow(2, _retryCount).clamp(1, 30).toInt()),
        _connectWebSocket);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _channel?.sink.close();
  }
}
