import 'package:bloc_with_clean/features/register/data/entity/business_userregister_model.dart';
import 'package:bloc_with_clean/features/register/data/repositary/BusinessRegisterRepository.dart';

class RegisterUserUseCase {
  final BusinessRegisterRepository repository;

  RegisterUserUseCase(this.repository);

  Future<BusinessRegister?> registerUser({
    required String name,
    required String email,
    required String contact,
    required String bType,
    required String bGst,
    required String bPassword,
    required String confirmBPass,
  }) async {
    return await repository.registerUser(
        name: name, email: email, contact: contact, bType: bType, bGst: bGst, bPassword: bPassword, confirmBPass: confirmBPass);
  }
}
