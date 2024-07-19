import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/verification/basic_verification/verification_bloc.dart';
import '../../utils/utils.dart';

class SignupVerificationDetails extends StatelessWidget {
  const SignupVerificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationBloc, VerificationState>(
      buildWhen: (previous, current) {
        return previous.businessVerification != current.businessVerification;
      },
      builder: (context, state) {
        if (state is VerificationUserUnAuthorized) {
          final value = state.businessVerification;
          return Column(
            children: [
              ListTile(
                onTap: () => value.isBusinessCategorySelected
                    ? context.push('/select-category')
                    : showSnackBar("Business category already selected"),
                leading:
                    const Icon(Icons.category_outlined, color: Colors.black),
                title: const Text("Select business category"),
                trailing: Icon(
                  value.isBusinessCategorySelected ? Icons.done : Icons.info,
                  color: value.isBusinessCategorySelected
                      ? Colors.green
                      : Colors.red,
                ),
              ),
              ListTile(
                onTap: () => context.push("/signup/otp-verification"),
                leading: const Icon(Icons.email_outlined, color: Colors.black),
                title: const Text("Email verification"),
                trailing: Icon(
                  value.isEmailVerified ? Icons.done : Icons.info,
                  color: value.isEmailVerified ? Colors.green : Colors.red,
                ),
              ),
              ListTile(
                onTap: () => context.push("/signup/otp-verification"),
                leading: const Icon(Icons.phone_outlined, color: Colors.black),
                title: const Text("Mobile number verification"),
                trailing: Icon(
                  value.isBusinessNumerVerified ? Icons.done : Icons.info,
                  color:
                      value.isBusinessNumerVerified ? Colors.green : Colors.red,
                ),
              ),
              ListTile(
                onTap: () => value.isVerificationDetailsSubmitted
                    ? showSnackBar("Already submitted")
                    : context.push('/verification'),
                leading: const Icon(
                  Icons.business_center_outlined,
                  color: Colors.black,
                ),
                title: const Text("Business details"),
                trailing: Icon(
                  value.isVerificationDetailsSubmitted
                      ? Icons.done
                      : Icons.info,
                  color: value.isVerificationDetailsSubmitted
                      ? Colors.green
                      : Colors.red,
                ),
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
