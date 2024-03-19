import 'package:code_adviser_ai/api/api_service.dart';
import 'package:code_adviser_ai/provider/code_provider.dart';
import 'package:code_adviser_ai/widgets/response_box.dart';
import 'package:code_adviser_ai/widgets/skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewBox extends StatefulWidget {
  final String desc;
  const ReviewBox({
    super.key,
    required this.desc,
  });

  @override
  State<ReviewBox> createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  final ApiService _apiService = ApiService();

  String codeQuality = '';
  String potentalBugs = '';
  String improvements = '';
  bool once = true;

  void review() async {
    final code = Provider.of<CodeProvider>(context).codeController.text;
    codeQuality = await _apiService.answer(
        '${widget.desc}\nRate the following code in the scale of 10.\n$code\nGive the response within 5 lines.');
    setState(() {});
    potentalBugs = await _apiService.answer(
        'Give the potential bugs of this code. Give the response within 5 line');
    setState(() {});
    improvements = await _apiService.answer(
        'Suggest some improvements we can do it in this code. Within 5 lines');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (once) {
      once = false;
      review();
    }
    return ListView(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Provider.of<CodeProvider>(context, listen: false)
                  .updateReviewStatus(false);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          child: const Text(
            'Code Adviser.ai 🤖',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Code Quality',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        codeQuality == ''
            ? const SkeletalLoader()
            : ResponseBox(data: codeQuality),
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Potential Bugs',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        potentalBugs == ''
            ? const SkeletalLoader()
            : ResponseBox(data: potentalBugs),
        const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Improvements',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        improvements == ''
            ? const SkeletalLoader()
            : ResponseBox(data: improvements)
      ],
    );
  }
}
