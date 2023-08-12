import 'package:flutter/material.dart';
import 'package:personal_token_tracker/utils/enums.dart';
import 'package:personal_token_tracker/view_model/profile_view_model.dart';
import 'package:personal_token_tracker/view_model/transactions_view_model.dart';
import 'package:personal_token_tracker/widget/custome_text_form_field.dart';
import 'package:provider/provider.dart';

class MintDialog extends StatefulWidget {
  const MintDialog({Key? key}) : super(key: key);

  @override
  State<MintDialog> createState() => _MintDialogState();
}

class _MintDialogState extends State<MintDialog> {
  late final _prov = Provider.of<TransactionsViewModel>(context);
  final _amount = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: size.height * 0.4,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffF9F9F9)),
        child: _prov.state == LoadingState.loading
            ? const CircularProgressIndicator()
            : _buildMintForm(context),
      ),
    );
  }

  Widget _buildMintForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transfer Fund",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close))
            ],
          ),
          const Divider(),
          CustomTextFormField(
            controller: _amount,
            fillColor: const Color(0xff31353F),
            inputColor: const Color(0xffFFFFFF),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Valid Amount";
              }
              return null;
            },
            hintText: "Amount",
            customPadding: const EdgeInsets.only(left: 4.0),
            hintTextStyle:
                const TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ProfileViewModel>(
                  builder: (context, value, child) => TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await value.transfer();
                        }
                      },
                      child: const Text(
                        "Transfer",
                        style: TextStyle(color: Color(0XFF171532)),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
