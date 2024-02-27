part of 'base.dart';

abstract class BaseController extends GetxController {
  final _uiStateController = UiState.defaults.obs;

  UiState get uiState => _uiStateController.value;

  updateUiState(UiState state) => _uiStateController(state);

  resetUiState() => _uiStateController(UiState.defaults);

  showLoading() => updateUiState(UiState.loading);

  hideLoading() => resetUiState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);

  @override
  void onClose() {
    _errorMessageController.close();
    _uiStateController.close();
    super.onClose();
  }

  dynamic callDataService<T>(
    Future<T> future, {
    Function(T response)? onSuccess,
    Function(Exception exception)? onError,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? exception;

    onStart == null ? showLoading() : onStart();
    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } on TimeoutException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } on NetworkException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } on JsonFormatException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } on NotFoundException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } on ApiException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } on AppException catch (ex) {
      exception = ex;
      showErrorMessage(ex.message);
    } catch (error) {
      exception = AppException(message: "$error");
      debugPrint("Controller>>>>>> error $error");
      showErrorMessage(errorMessage);
    }

    if (onError != null) onError(exception);

    onComplete == null ? hideLoading() : onComplete();
  }
}
