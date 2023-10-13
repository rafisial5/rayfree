
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class CollectTaxController extends GetxController{



  XFile? imageFile;
  RxString scannedText = "".obs;
void  getImage() async {
  try{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedImage != null){
      imageFile = pickedImage;
      getRecognizedTExt(pickedImage);

    }

  }catch(e){

  }
}


void getRecognizedTExt(XFile image) async{
  final inputImage = InputImage.fromFilePath(image.path);
  final textDetector = GoogleMlKit.vision.textRecognizer();
  RecognizedText recognizedText = await textDetector.processImage(inputImage);
  await textDetector.close();
  scannedText.value = "";
  String pattern1 = r'(^[A-Z]{2}[-,=,:]?[0-9]{4}$)';
  String pattern2 = r'(^[A-Z]{2}[-,=,:]?[0-9]{3}$)';
  String pattern3 = r'(^[A-Z]{3}[-,=,:]?[0-9]{3}$)';
  String pattern4 = r'(^[A-Z]{3}[-,=,:]?[0-9]{4}$)';
  String pattern5 = r'(^[A-Z]{2}[-,=,:]?[0-9]{5}$)';
  String pattern6 = r'(^[A-Z]{3}[-,=,:]?[0-9]{5}$)';

  for(TextBlock block in recognizedText.blocks){
    for(TextLine line in block.lines){
      RegExp regExp1 = RegExp(pattern1);
      RegExp regExp2 = RegExp(pattern2);
      RegExp regExp3 = RegExp(pattern3);
      RegExp regExp4 = RegExp(pattern4);
      RegExp regExp5 = RegExp(pattern5);
      RegExp regExp6 = RegExp(pattern6);

      for(TextElement element in line.elements){
        // print("========> element: ${element.text.toString()}");
        String selectedText = element.text;
        if(selectedText != null && selectedText.length < 8 &&
            selectedText.contains(regExp1) || selectedText.contains(regExp6) ||
            selectedText.contains(regExp2) || selectedText.contains(regExp3) ||
            selectedText.contains(regExp4) || selectedText.contains(regExp5) ){
          print(selectedText.replaceAll(new RegExp('\W+'),''));
          if(scannedText.value.isEmpty) {
            scannedText.value = "${line.text}";
          }
        }

      }
    }
  }

}


  MaskTextInputFormatter cnicMaskFormatter =  MaskTextInputFormatter(
      mask: '#####-#######-#');
  MaskTextInputFormatter numberPlateFormatter = MaskTextInputFormatter(mask: '###-####');

  TextEditingController cnicTEController = TextEditingController();



  RxBool cnicErrorVisible = RxBool(false);

  RxString cnicErrorMsg = "".obs;
  RxString scanCNICFrontImage = "".obs;



  FocusNode cnicFocusNode = FocusNode();
  // onNextClicked() async {
  //
  //   String cnicNo = cnicTEController.text.replaceAll("-", "");
  //   if(cnicNo.length<13)
  //     return;
  // _progressDialog.showDialog(title: "Please Wait..");
  // bool checkIsInternetAvailable=await CommonCode().checkInternetAccess();
  // String dob = dobInScanCnicTEController.text;
  // String userName = clientNameInScanCnicTEController.text;
  // String userCnicDOI = cnicDOITEController.text;
  // String userCnicDOE = doeTEController.text;
  // String userPhoneNo = phoneNoTEController.text.replaceAll("-", "");
  // BeneficiaryModel isBeneficiaryAlreadyCreated=BeneficiaryModel();
  // if(checkIsInternetAvailable){
  //   isBeneficiaryAlreadyCreated=await BeneficiaryService().getBeneficiaryByCnic(cnic: cnicNo);
  //   if(isBeneficiaryAlreadyCreated.pregnancies.length > 0)
  //     isBeneficiaryAlreadyCreated.localBeneficiaryIsActive=true;
  // }
  // else{
  //   isBeneficiaryAlreadyCreated=await BeneficiaryFloorService().searchBeneficiaryByCNICorEMR(cnic: cnicNo);
  // }
  // _progressDialog.dismissDialog();
  // CustomDialogs _customDialog=CustomDialogs();
  // if(isBeneficiaryAlreadyCreated.statusDescription == "Beneficiary retrieved successfully." && isBeneficiaryAlreadyCreated.localBeneficiaryIsActive){
  //   _customDialog.showErrorDialog(
  //       "Alert!", "Beneficiary already exist", DialogType.SUCCES, Colors.green,
  //       onOkBtnPressed: () {
  //         Get.toNamed(kComplianceHistoryScreen,arguments: isBeneficiaryAlreadyCreated);
  //       });

  //   }
  //   else if(isBeneficiaryAlreadyCreated.statusDescription == "Beneficiary retrieved successfully." && isBeneficiaryAlreadyCreated.localBeneficiaryIsActive==false){
  //     _customDialog.showErrorDialog(
  //         "Alert!", "Beneficiary already exist", DialogType.SUCCES, Colors.green,
  //         onOkBtnPressed: () {
  //           Get.toNamed(kClientRegistrationScreen, arguments: [isBeneficiaryAlreadyCreated,]);
  //         });
  //
  //   }
  //   else{
  //     beneficiaryModel.userDOB = dob;
  //     beneficiaryModel.userCNIC = cnicNo;
  //     beneficiaryModel.userName = userName;
  //     // cnicModel.userCNICDOI = userCnicDOI;
  //     beneficiaryModel.userCNICDOE = userCnicDOE;
  //     // cnicModel.userPhone = userPhoneNo;
  //     // cnicModel.userDistrict= getDistrictIdByDistrictName(disName: districtSelected.value);
  //     beneficiaryModel.facilityModel.district.districtName=districtSelected.value;
  //     beneficiaryModel.facilityModel.district.districtId=getDistrictIdByDistrictName(disName: districtSelected.value);
  //     // Get.toNamed(kClientRegistrationFormScreen, arguments: cnicModel);
  //     Get.toNamed(kVerifyUserScreen, arguments: [beneficiaryModel,beneficiaryDocumentModel]);
  //   }
  //
  //
  // }

  @override
  void onInit()async {

    // districts.add("Select District");
    // districts.add("");
    // getDistrictsList();
    // districtDDController = CustomDropDownController(
    //   dropDownList: districts,
    //   selectedItem: districtSelected,
    //   onDropDownItemClick: (selectedDistrict) {
    //     districtDDController.selectedItem.value = selectedDistrict;
    //     _checkSelectedDistrictProfileSectionValidity();
    //     districtDDController.openAndCloseDrawer();

    //if(selectedDistrict != "Select District") {
    // } else {
    //   talukaDDController.selectedItem.value = talukaList.first;
    //   ucDDController.selectedItem.value = uCList.first;
    //   facilityNameDDController.selectedItem.value = facilityNamesList.first;
    // }
    //   },
    //   dropDownBGColor: Color(0xFFededed),
    // );

    // userModel.value=await userSession.getUserModel();
    // districtSelected.value = userModel.value.userFacility.district.districtName;
    //
    // bottomNavigationController.selectedIndex.value =1;
    super.onInit();
  }






  void removeFocus() {
    if (cnicFocusNode.hasFocus) {
      cnicFocusNode.unfocus();
    }

  }



  void onCNICScan() {

    cnicValidation();

    // clientNameInScanCnicValidation();

    // dobInScanCnicValidation();

    // cnicDOIValidation();

    // cnicDOEValidation();

    // phoneNoValidation();

  }

  bool cnicValidation() {
    if (cnicTEController.text.length == 0) {
      cnicErrorVisible.value = true;
      cnicErrorMsg.value = "CNIC is required!";
    }else if(cnicTEController.text.startsWith("0")){
      cnicErrorVisible.value = true;
      cnicErrorMsg.value = "CNIC can not start with 0!";
    }else if (cnicTEController.text.length < 15) {
      cnicErrorVisible.value = true;
      cnicErrorMsg.value = "CNIC should minimum 13 letters long!";
    }else if (RegExp(r'\D').hasMatch(cnicTEController.text.replaceAll("-", "")) || cnicTEController.text.length > 15) {
      cnicErrorVisible.value = true;
      cnicErrorMsg.value = "Invalid CNIC number!";
    }
    /*else if(int.parse(cnicTEController.text[14])%2 != 0){
      cnicErrorVisible.value = true;
      cnicErrorMsg.value = "This CNIC Belongs to Male!";
    }*/
    else {
      cnicErrorVisible.value = false;
      cnicErrorMsg.value = "";
    }
    return cnicErrorVisible.value;
  }


  RxString scanCNICBtnText = "Scan CNIC Front".obs;
  RxBool enableNextBtn = false.obs;
  RxBool isImageCapture=false.obs;
  /*final ImagePicker _picker = ImagePicker();*/

  // void captureImage({required String imageType})async{
  //   try{
  //
  //     if(true){
  //
  //       if(true){
  //         isImageCapture.value = true;
  //
  //         File? croppedImage;
  //         try {
  //           String imagePath = (await EdgeDetection.detectEdge) ?? "";
  //           if (imagePath.length > 0) {
  //             croppedImage = File.fromUri(Uri.parse(imagePath));
  //           }
  //         } on PlatformException catch (e) {}
  //
  //         // _progressDialog.showDialog();
  //         if (croppedImage == null) {
  //           isImageCapture.value = false;
  //           // _progressDialog.dismissDialog();
  //         } else {
  //           isImageCapture.value = false;
  //           File compressImage = await _compressImage(croppedImage);
  //           print("=======> compress image: ${compressImage.toString()}");
  //
  //           scanCNICFrontImage.value = croppedImage.path;
  //           // cnicFrontErrorVisible.value =
  //           //     scanCNICFrontImage.value.startsWith("assets");
  //           // if (beneficiaryDocumentModel.docName.contains('CNIC Front')) {
  //           //   int index =
  //           //   beneficiaryDocumentModel.docName.indexOf('CNIC Front');
  //           //   beneficiaryDocumentModel.docFile.removeAt(index);
  //           //   beneficiaryDocumentModel.docFile
  //           //       .insert(index, compressImage.path);
  //           // } else {
  //           //   beneficiaryDocumentModel.docFile.add(compressImage.path);
  //           //   beneficiaryDocumentModel.docName.add('CNIC Front');
  //           // }
  //
  //           // imageType =='Front' ? scanCNICFrontImage.value=croppedImage.path :scanCNICBackImage.value=croppedImage.path;
  //           // _readData(InputImage.fromFilePath(croppedImage.path));
  //           // : _progressDialog.dismissDialog();
  //         }
  //       }
  //     }
  //   }
  //   catch(e){
  //     isImageCapture.value = false;
  //   }
  // }
  //
  //
  //
  //
  // Future<File> _compressImage(File file) async {
  //
  //   CompressFormat compressFormat = CompressFormat.jpeg;
  //   try {
  //     final filePath = file.absolute.path;
  //     // Create output file path
  //     int lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
  //     if (lastIndex == -1) {
  //       lastIndex = filePath.lastIndexOf(new RegExp(r'.png'));
  //       compressFormat = CompressFormat.png;
  //     }
  //     final splitted = filePath.substring(0, (lastIndex));
  //     final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
  //     File? compressedImage = await FlutterImageCompress.compressAndGetFile(
  //         filePath, outPath,
  //         quality: 10, format: compressFormat);
  //     if(compressedImage!=null){
  //       double sizeKb = (compressedImage.lengthSync() / 1000).toPrecision(2);
  //       // CommonCode().showToast(message: 'ImageSize: $sizeKb KB');
  //       return compressedImage;
  //     }
  //     else {
  //       return file;
  //     }
  //   } catch (e) {
  //     return file;
  //   }
  // }


  // void _readData(InputImage inputImage)async{
  //
  //   List<String> cnicDates = [];
  //   GoogleMlKit.vision.languageModelManager();
  //   TextDetector textDetector = GoogleMlKit.vision.textDetector();
  //   try{
  //     final RecognisedText recognisedText = await textDetector.processImage(inputImage);
  //     bool isNameNext = false;
  //     for (TextBlock block in recognisedText.blocks) {
  //       // final Rect rect = block.rect;
  //       // final List<Offset> cornerPoints = block.cornerPoints;
  //       // final String text = block.text;
  //       final List<String> languages = block.recognizedLanguages;
  //       for (TextLine line in block.lines) {
  //         for (TextElement element in line.elements) {
  //           String selectedText = element.text;
  //           if(selectedText != null && selectedText.length == 15 && selectedText.contains("-",5)
  //               && selectedText.contains("-",13)){
  //             // clearTEControllers();
  //             cnicTEController.text = selectedText;
  //           }else if(selectedText != null && selectedText.length == 10 &&
  //               ((selectedText.contains("/",2) && selectedText.contains("/",5)) ||
  //                   (selectedText.contains(".",2) && selectedText.contains(".",5)))){
  //             String sDate = selectedText.replaceAll(".", "-");
  //             sDate = sDate.replaceAll("/", "-");
  //             cnicDates.add(sDate.replaceAll("\n", ""));
  //           }
  //         }
  //         if(isNameNext){
  //           // clientNameInScanCnicTEController.text = line.text;
  //           isNameNext = false;
  //         }
  //         if(line.text.toLowerCase() == "name" || line.text.toLowerCase() == "nane" ||
  //             line.text.toLowerCase() == "nam" || line.text.toLowerCase() == "ame"){
  //           isNameNext = true;
  //           // clientNameInScanCnicTEController.clear();
  //         }
  //       }
  //     }
  //   }catch(e){}
  //
  //   if(cnicTEController.value.text.length > 0){
  //     scanCNICBtnText.value = "Scan CNIC Front";
  //     enableNextBtn.value = true;
  //   }
  //   onCNICScan();
  //   // _progressDialog.dismissDialog();
  // }

}