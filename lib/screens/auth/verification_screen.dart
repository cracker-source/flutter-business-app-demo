import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/verification/basic_verification/verification_bloc.dart';
import '../../bloc/verification/business_verification/business_verification_bloc.dart';
import '../../utils/utils.dart';
import '../../widgets/common/loading_view.dart';
import '../../widgets/verification_screen/pan_card_details.dart';
import '../../widgets/verification_screen/shop_details.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final location = await getUserCurrentLocation();

    if (context.mounted) {
      context.read<BusinessVerificationBloc>().add(
            BussinessVerificationLocationEvent(
              [location?.longitude ?? 0, location?.latitude ?? 0],
            ),
          );
    }
  }

  final BoxDecoration _boxDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 4,
        color: Colors.black.withOpacity(0.3),
      ),
    ],
  );

  final AppBar _appBar = AppBar(
    title: const Text("Verification"),
    shadowColor: Colors.grey.shade50,
    surfaceTintColor: Colors.white,
  );

  void _submitVerification(BuildContext context) {
    final bool isAllDetailsSubmitted = _formKey.currentState!.validate() &&
        (context
            .read<BusinessVerificationBloc>()
            .state
            .businessVerification
            .panCardDetailsList
            .isNotEmpty) &&
        (context
            .read<BusinessVerificationBloc>()
            .state
            .businessVerification
            .shopPhotosList
            .isNotEmpty) &&
        (context
            .read<BusinessVerificationBloc>()
            .state
            .businessVerification
            .businessLocation
            .isNotEmpty);

    if (isAllDetailsSubmitted) {
      context
          .read<BusinessVerificationBloc>()
          .add(BusinessVerificationRequested(pancardNumber: _controller.text));
    } else {
      showSnackBar("Please provide the above details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _appBar,
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 70,
            decoration: _boxDecoration,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _submitVerification(context),
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PanCardDetails(
                      formKey: _formKey,
                      pancardController: _controller,
                    ),
                    const SizedBox(height: 15),
                    const ShopDetails()
                  ],
                ),
              ),
            ),
          ),
        ),
        BlocConsumer<BusinessVerificationBloc, BusinessVerificationState>(
          listener: (context, state) {
            if (state is BusinessVerificationSuccessState) {
              showSnackBar("Submitted successfully");
              context
                  .read<VerificationBloc>()
                  .add(const VerificationDetailsLoadEvent());
              context.go("/authorization");
            }
          },
          builder: (context, state) {
            if (state is BusinessVerificationLoadingState) {
              return const LoadingView();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
