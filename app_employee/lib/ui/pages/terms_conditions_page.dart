import 'package:flutter/material.dart';

import '../ui.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 25,
            right: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      backButtonComponent(context),
                      const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  notificationGeralButtonComponent(context),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text('Carnawash – USER TERMS AND CONDITIONS PLEASE READ THESE TERMS CAREFULLY BEFORE ACCESSING OR USING THE SERVICES.\n\nContractual Relationship 1. These terms of use (Terms) govern the access or use by you, an individual, of our car wash application, website, content, car wash products, and services (Services) made available by Linda Vibes Pty Ltd ACN 626 332 401 as trustee of the M&C Family Trust ABN 63 583 543 840 (Carnawash). 2. Your access and use of the Services constitutes your agreement to be bound by these Terms. These Terms establish a contractual relationship between you and Carnawash. If you do not agree to these Terms, you may not access or use the Services. These Terms expressly supersede prior agreements or arrangements with you. Carnawash may immediately terminate these Terms or any Services with respect to you, or generally cease offering or deny access to the Services or any portion thereof, at any time for any reason. 3. Carnawash may amend the Terms from time to time. Amendments will be effective upon Carnawash’s posting the new Terms on its website. Your continued access or use of the Services after such posting constitutes your consent to be bound by the new Terms. 4. Our collection and use of personal information in connection with the Services is as provided in Carnawash’s Privacy Policy located at carnawashapp.com. The Services 5. The Services provided by Carnawash constitute a technology platform that enables users of Carnawash’s mobile applications or websites provided as part of the Services (each, an Application) to arrange and schedule car washing services with independent third party providers (Third Party Providers) of such services. Unless otherwise agreed by Carnawash in a separate written agreement with you, the Services are made available solely for your personal, non-commercial use. 6. You acknowledge that Carnawash does not provide transportation or logistics services or function as a transportation carrier. License 7. Subject to your compliance with these Terms, Carnawash grants you a limited, non-exclusive, non-sublicensable, revocable, non-transferrable license to: a. access and use the Applications on your personal device solely in connection with your use of the Services; and b. access and use any content, information and related materials that may be made available through the Services, in each case solely for your personal, non-commercial use. 8. Any rights not expressly granted herein are reserved by Carnawash and Carnawash’s licensors. Restrictions 9. You may not: a. remove any copyright, trademark or other proprietary notices from any portion of the Services; b. reproduce, modify, prepare derivative works based upon, distribute, license, lease, sell, resell, transfer, publicly display, publicly perform, transmit, stream, broadcast or otherwise exploit the Services except as expressly permitted by Carnawash; c. decompile, reverse engineer or disassemble the Services except as may be permitted by applicable law; d. link to, mirror or frame any portion of the Services; e. cause or launch any programs or scripts for the purpose of scraping, indexing, surveying, or otherwise data mining any portion of the Services or unduly burdening or hindering the operation and/or functionality of any aspect of the Services; or f. attempt to gain unauthorized access to or impair any aspect of the Services or its related systems or networks. Provision of the Services 10. You acknowledge that some or all of the Services may be made available to you by independent Third Party Providers. Where an independent Third Party Provider provides Services to you, then a separate contract is formed between you and the Third Party Provider for those Services. Third Party Services and Content 11. The Services may be made available or accessed from third party services and content (including advertising) that Carnawash does not control, such as via Apple Inc., or via Google Inc. You acknowledge that different terms of use and privacy policies may apply to your use of such third party services and content. 12. Carnawash does not endorse such third party services and content and in no event shall Carnawash be responsible or liable for any products or services of such third party providers. Additionally, Apple Inc., Google, Inc., Microsoft Corporation or BlackBerry Limited and/or their applicable international subsidiaries and affiliates will be third-party beneficiaries to this contract if you access the Services using Applications developed for Apple iOS, Android, Microsoft Windows, or Blackberry-powered mobile devices, respectively. 13. These third party beneficiaries are not parties to this contract and are not responsible for the provision or support of the Services in any manner. Your access to the Services using these devices is subject to terms set forth in the applicable third party beneficiary’s terms of service. Ownership 14. The Services and all rights therein are and shall remain Carnawash’s property. Neither these Terms nor your use of the Services convey or grant to you any rights: a. in or related to the Services except for the limited license granted above; or b. to use or reference in any manner Carnawash’s company name, logos, trademarks (if any). Your Use of the Services User Accounts 15. To use some or all of the Services, you must register for and maintain an active account (Account). 16. You must be at least 18 years of age to obtain an Account. Account registration requires you to submit to Carnawash certain personal information, such as your name, address, mobile phone number and age, as well as at least one valid payment method (either a credit card or accepted payment partner such as Paypal or Stripe). 17. You agree to maintain accurate, complete, and up-to-date information in your Account. Your failure to maintain accurate, complete, and up-to-date Account information, including having an invalid or expired payment method on file, may result in your inability to access and use the Services or Carnawash’s termination of these Terms with you. 18. You are responsible for all activity that occurs under your Account, and you agree to maintain the security and secrecy of your Account username and password at all times. Unless otherwise permitted by Carnawash in writing, you may only possess one Account. User Requirements and Conduct 19. The Service is not available for use by persons under the age of 18. You may not authorize third parties to use your Account, and you may not allow persons under the age of 18 to receive transportation or logistics services from Third Party Providers unless they are accompanied by you. 20. You may not assign or otherwise transfer your Account to any other person or entity. You agree to comply with all applicable laws when using the Services. 21. You will not, in your use of the Services, cause nuisance, annoyance, inconvenience, or property damage, whether to the Third Party Provider or any other party. In certain instances you may be asked to provide proof of identity to access or use the Services, and you agree that you may be denied access to or use of the Services if you refuse to provide proof of identity. 22. You understand and agree that whilst Carnawash or its Third Party Providers are engaged to clean your vehicle we reserve the right not to clean vehicles that are covered with excessive amounts (as determined by us, acting reasonably) of mud or dirt on the wheels or vehicle body, or mud or dirt or other substance inside the vehicle that is excessively time consuming, (as determined by us acting reasonably) to clean. Text Messaging 23. By creating an Account, you agree that the Services may send you informational text messages (SMS) as part of the normal business operation of your use of the Services. You may opt-out of receiving text (SMS) messages from Carnawash at any time by sending an email to suppport@carnawashapp.com indicating that you no longer wish to receive such messages, along with the phone number of the mobile device receiving the messages. You acknowledge that opting out of receiving SMS messages may impact your use of the Services. User Provided Content 24. Carnawash may, in Carnawash’s sole discretion, permit you from time to time to submit, upload, publish or otherwise make available to Carnawash through the Services textual, audio, and/or visual content and information, including commentary and feedback related to the Services, initiation of support requests, and submission of entries for competitions and promotions (if any) (User Content). 25. Any User Content provided by you remains your property. However, by providing User Content to Carnawash, you grant Carnawash a worldwide, perpetual, irrevocable, transferrable, royalty-free license, with the right to sublicense, to use, copy, modify, create derivative works of, distribute, publicly display, publicly perform, and otherwise exploit in any manner such User Content in all formats and distribution channels now known or devised in the future (including in connection with the Services and Carnawash’s business and on third-party sites and services), without further notice to or consent from you, and without the requirement of payment to you or any other person or entity. 26. You represent and warrant that: a. you either are the sole and exclusive owner of all User Content or you have all rights, licenses, consents and releases necessary to grant Carnawash the license to the User Content; and b. neither the User Content, nor your submission, uploading, publishing or otherwise making available of such User Content nor Carnawash’s use of the User Content will infringe, misappropriate or violate a third party’s intellectual property or proprietary rights, or rights of publicity or privacy, or result in the violation of any applicable law or regulation. 27. You agree to not provide User Content that is defamatory, libellous, hateful, violent, obscene, pornographic, unlawful, or otherwise offensive, as determined by Carnawash in its sole discretion, whether or not such material may be protected by law. Carnawash may, but shall not be obligated to, review, monitor, or remove User Content, at Carnawash’s sole discretion and at any time and for any reason, without notice to you. Network Access and Devices 28. You are responsible for obtaining the data network access necessary to use the Services. Your mobile network’s data and SMS messaging rates and fees may apply if you access or use the Services from a wireless-enabled device and you shall be responsible for such rates and fees. You are responsible for acquiring and updating compatible hardware or devices necessary to access and use the Services and Applications and any updates thereto. Carnawash does not guarantee that the Services, or any part of them, will function on any particular hardware or devices. In addition, the Services may be subject to malfunctions and delays inherent in the use of the Internet and electronic communications. Payment 29. You understand that use of the Services will result in charges to you for the services you receive from a Third Party Provider (Charges). After you have received services, through your use of the Service, Carnawash will facilitate your payment of the applicable Charges on behalf of the Third Party Provider as such Third Party Provider’s limited payment collection agent. Payment of the Charges in such manner shall be considered the same as payment made directly by you to the Third Party Provider. 30. Charges will be inclusive of applicable taxes where required by law. Charges paid by you are final and non-refundable, unless otherwise determined by Carnawash. 31. All Charges are due immediately and payment will be facilitated by Carnawash using the preferred payment method designated in your Account, after which Carnawash will send you a receipt by email. If your primary Account payment method is determined to be expired, invalid or otherwise not able to be charged, you agree that Carnawash may, as the Third Party Provider’s limited payment collection agent, use a secondary payment method in your Account, if available. 32. As between you and Carnawash, Carnawash reserves the right to establish, remove and/or revise Charges for any or all Services at any time in Carnawash’s sole discretion. 33. Carnawash will use reasonable efforts to inform you of Charges that may apply, provided that you will be responsible for Charges incurred under your Account regardless of your awareness of such Charges or the amounts thereof. 34. You may elect to cancel your request for Services from a Third Party Provider at any time prior to such Third Party Provider’s arrival, in which case you may be charged a cancellation fee. 35. This payment structure is intended to fully compensate the Third Party Provider for the services. Carnawash does not designate any portion of your payment as a tip or gratuity to the Third Party Provider. 36. After you have received services obtained through the Service, you will have the opportunity to rate your experience and leave additional feedback about your Third Party Provider. Disclaimers; Limitation of Liability; Indemnity Disclaimer 37. The services are provided “as is” and “as available.” Carnawash disclaims all representations and warranties, express, implied or statutory, not expressly set out in these Terms, including the implied warranties of merchantability, fitness for a particular purpose and non-infringement. 38. In addition, Carnawash makes no representation, warranty, or guarantee regarding the reliability, timeliness, quality, suitability or availability of the services or any services or goods requested through the use of the services, or that the services will be uninterrupted or error-free. 39. Carnawash does not guarantee the quality, suitability, safety or ability of Third Party Providers. You agree that the entire risk arising out of your use of the services, and any service or good requested in connection therewith, remains solely with you, to the maximum extent permitted under applicable law. Limitation Of Liability 40. Carnawash shall not be liable for indirect, incidental, special, exemplary, punitive or consequential damages, including lost profits, lost data, personal injury or property damage related to, in connection with, or otherwise resulting from any use of the Services, even if Carnawash has been advised of the possibility of such damages. 41. Carnawash shall not be liable for any damages, liability or losses arising out of: a. your use of or reliance on the Services or your inability to access or use the Services; or b. any transaction or relationship between you and any Third Party provider, even if Carnawash has been advised of the possibility of such damages.  42. Carnawash shall not be liable for delay or failure in performance resulting from causes beyond Carnawash’s reasonable control. Subject to clause 4645, in no event shall Carnawash’s total liability to you in connection with the services for all damages, losses and causes of action exceed five hundred dollars (\$500). 43. Carnawash’s services may be used by you to request and schedule car wash and car cleaning services with Third Party Providers, but you agree that Carnawash has no responsibility or liability to you related to any Services provided to you by Third Party Providers other than as expressly set forth in these terms. 44. The limitations and disclaimers in these Terms do not purport to limit liability or alter your rights as a consumer that cannot be excluded under applicable law. Certain legislation including the Australian Consumer Law (ACL) and the Consumer and Competition Act 2010 (Cth), and similar consumer protection laws and regulations may confer you with rights, warranties, guarantees and remedies relating to the provision of services by Carnawash to you which cannot be excluded, restricted or modified (Statutory Rights). 45. Carnawash’s liability is governed solely by the ACL and these Terms. Carnawash excludes all conditions and warranties implied by custom, law or statute except for your Statutory Rights. Except for your Statutory Rights, all Services are provided to you without warranties of any kind, either express or implied; and Carnawash expressly disclaims all warranties of any kind including but not limited to implied warranties of merchantability and fitness for a particular purpose. 46. If you are a consumer as defined in the ACL, the following applies to you: Carnawash guarantees that the services we supply to you are rendered with due care and skill; fit for the purpose that we advertise, or that you have told us what you are acquiring the services for, or that you have told us about a result which you wish the services to achieve (unless we consider and disclose that this purpose is not achievable); and will be supplied within a reasonable time. To the extent we are unable to exclude liability; our total liability for loss or damage you suffer or incur from our services is limited to us re-supplying the services to you, or, at our option, Carnawash refunding to you the amount you have paid Carnawash for the services to which your claim relates, minus any payment processing fee or payment gateway refund fee. Indemnity 47. You agree to indemnify and hold Carnawash and its officers, directors, employees and agents harmless from any and all claims, demands, losses, liabilities, and expenses (including attorneys’ fees) arising out of or in connection with: a. your use of the Services; b. your breach or violation of any of these Terms; c. Carnawash’s use of your User Content; or d. your violation of the rights of any third party, including Third Party Providers and third party beneficiaries. Governing Law and Arbitration. 48. Except as otherwise set forth in these Terms, these Terms shall be exclusively governed by and construed in accordance with the laws of New South Wales. 49. Any disputes arising from these terms and conditions that cannot be resolved between the parties will be submitted in the first instance to a mediator identified and agreed by the parties. If no such mediator can be agreed then a mediator will be appointed by the President of the Law Society of New South Wales. The rules for mediation will be determined by the mediator and both parties agree to be bound by these rules. The parties must not commence any legal proceedings until the conclusion of the mediation except in relation to the bringing of an urgent application. Other Provisions General 50. You may not assign or transfer these Terms in whole or in part without Carnawash’s prior written approval. You give your approval to Carnawash for it to assign or transfer these Terms in whole or in part, including to: a. a subsidiary or affiliate; b. an acquirer of Carnawash’s equity, business or assets; or c. a successor by merger. 51. No joint venture, partnership, employment or agency relationship exists between you, Carnawash or any Third Party Provider as a result of the contract between you and Carnawash or your use of the Services. 52. If any provision of these Terms is held to be illegal, invalid or unenforceable, in whole or in part, under any law, such provision or part thereof shall to that extent be deemed not to form part of these Terms but the legality, validity and enforceability of the other provisions in these Terms shall not be affected. 53. In that event, the parties shall replace the illegal, invalid or unenforceable provision or part thereof with a provision or part thereof that is legal, valid and enforceable and that has, to the greatest extent possible, a similar effect as the illegal, invalid or unenforceable provision or part thereof, given the contents and purpose of these Terms. 54. These Terms constitute the entire agreement and understanding of the parties with respect to its subject matter and replaces and supersedes all prior or contemporaneous agreements or undertakings regarding such subject matter. In these Terms, the words “including” and “include” mean “including, but not limited to.”'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
