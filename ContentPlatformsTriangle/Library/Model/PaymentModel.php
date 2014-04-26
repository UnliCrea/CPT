<?php

namespace Model;

class PaymentModel implements PaymentModelInterface {
	
	public function PayPalInitiate($paymentAmount) {

		if($paymentAmount < 4.99) { $_SESSION['PaymentError'] = 'Payment amount is less than $5.'; return false; }

		if(!isset($_SESSION['Username']) || is_null($_SESSION['Username']) || $_SESSION['Username'] == "") { return false; }
		else { $Username = $_SESSION['Username']; }

		$UserID = UserOperationsModel::IDFromUsername($Username);

		if(!$UserID) { $_SESSION['PaymentError'] = 'User is not logged in.'; return false; }

		$paypalModel = new PayPalModel();
		
		$currencyCodeType = "USD";
		$paymentType = "mastercard";

		$returnURL = "http://cj.unlicrea.com/earlyaccess/PayPalConfirm";
		$cancelURL = "http://cj.unlicrea.com/earlyaccess/";
		
		$items = array();
		$items[] = array('name' => 'Alpha - Concerned Joe Early Access', 'amt' => $paymentAmount, 'qty' => 1);

		$result = $resArray = $paypalModel->SetExpressCheckoutDG( $paymentAmount, $currencyCodeType, $paymentType, 
												$returnURL, $cancelURL, $items );

		var_dump($result); die();
		$ack = strtoupper($resArray["ACK"]);

		if($ack == "SUCCESS" || $ack == "SUCCESSWITHWARNING")
		{
			$token = urldecode($resArray["TOKEN"]);

			$this->logPayPalInitiation($token, $UserID);

			$paypalModel->RedirectToPayPal( $token );

			return true;
		} 
		else  
		{
			//Display a user friendly Error on the page using any of the following error information returned by PayPal
			$ErrorCode = urldecode($resArray["L_ERRORCODE0"]);
			$ErrorShortMsg = urldecode($resArray["L_SHORTMESSAGE0"]);
			$ErrorLongMsg = urldecode($resArray["L_LONGMESSAGE0"]);
			$ErrorSeverityCode = urldecode($resArray["L_SEVERITYCODE0"]);

			$errorString = "Error at PayPalInitiate at PaymentModel - SetExpressCheckout API call failed. " .
							"Detailed Error Message: " . $ErrorLongMsg .
							"Short Error Message: " . $ErrorShortMsg .
							"Error Code: " . $ErrorCode .
							"Error Severity Code: " . $ErrorSeverityCode;

			$_SESSION['PaymentError'] = 'Token request was unsuccessful.';
			error_log($errorString);
			return false;
		}
	}

	public function PayPalConfirm() {

		/* =====================================
		 *	 PayPal Express Checkout Call
		 * =====================================
		 */
		$paypalModel = new \Model\PayPalModel();

		/*
		 '------------------------------------
		 ' this  step is required to get parameters to make DoExpressCheckout API call, 
		 ' this step is required only if you are not storing the SetExpressCheckout API call's request values in you database.
		 ' ------------------------------------
		 */
		$res = $paypalModel->GetExpressCheckoutDetails( $_REQUEST['token'] );
			
		/*
		 '------------------------------------
		 ' The paymentAmount is the total value of
		 ' the purchase. 
		 '------------------------------------
		 */

		$finalPaymentAmount =  $res["PAYMENTREQUEST_0_AMT"];

		/*
		 '------------------------------------
		 ' Calls the DoExpressCheckoutPayment API call
		 '
		 ' The ConfirmPayment function is defined in the file PayPalFunctions.php,
		 ' that is included at the top of this file.
		 '-------------------------------------------------
		 */

		//Format the  parameters that were stored or received from GetExperessCheckout call.
		$token 				= $_REQUEST['token'];
		$payerID 			= $_REQUEST['PayerID'];
		$paymentType 		= 'Sale';
		$currencyCodeType 	= $res['CURRENCYCODE'];
		$items = array();

		$i = 0;
		// adding item details those set in setExpressCheckout
		while(isset($res["L_PAYMENTREQUEST_0_NAME$i"]))
		{
			$items[] = array('name' => $res["L_PAYMENTREQUEST_0_NAME$i"], 'amt' => $res["L_PAYMENTREQUEST_0_AMT$i"], 'qty' => $res["L_PAYMENTREQUEST_0_QTY$i"]);
			$i++;
		}

		$EarlyAccessLicenses = GenericOperationsModel::GetEarlyAccessLicensesLeft();
		if($EarlyAccessLicenses <= 0) { $_SESSION['PaymentError'] = 'There are no licenses left.'; return false; }

		$resArray = $paypalModel->ConfirmPayment ( $token, $paymentType, $currencyCodeType, $payerID, $finalPaymentAmount, $items );
		$ack = strtoupper($resArray["ACK"]);

		if( $ack == "SUCCESS" || $ack == "SUCCESSWITHWARNING" ) {

			GenericOperationsModel::SubtractEarlyAccessLicensesLeft();

			//Subtract Early Access
				
			/*
			 * TODO: Proceed with desired action after the payment 
			 * (ex: start download, start streaming, Add coins to the game.. etc)
			 '********************************************************************************************************************
			 '
			 ' THE PARTNER SHOULD SAVE THE KEY TRANSACTION RELATED INFORMATION LIKE
			 '                    transactionId & orderTime
			 '  IN THEIR OWN  DATABASE
			 ' AND THE REST OF THE INFORMATION CAN BE USED TO UNDERSTAND THE STATUS OF THE PAYMENT
			 '
			 '********************************************************************************************************************
			 */

			$transactionId		= $resArray["PAYMENTINFO_0_TRANSACTIONID"]; // Unique transaction ID of the payment.
			$transactionType 	= $resArray["PAYMENTINFO_0_TRANSACTIONTYPE"]; // The type of transaction Possible values: l  cart l  express-checkout
			$paymentType		= $resArray["PAYMENTINFO_0_PAYMENTTYPE"];  // Indicates whether the payment is instant or delayed. Possible values: l  none l  echeck l  instant
			$orderTime 			= $resArray["PAYMENTINFO_0_ORDERTIME"];  // Time/date stamp of payment
			$amt				= $resArray["PAYMENTINFO_0_AMT"];  // The final amount charged, including any  taxes from your Merchant Profile.
			$currencyCode		= $resArray["PAYMENTINFO_0_CURRENCYCODE"];  // A three-character currency code for one of the currencies listed in PayPay-Supported Transactional Currencies. Default: USD.
			$feeAmt				= $resArray["PAYMENTINFO_0_FEEAMT"];  // PayPal fee amount charged for the transaction
		//	$settleAmt			= $resArray["PAYMENTINFO_0_SETTLEAMT"];  // Amount deposited in your PayPal account after a currency conversion.
			$taxAmt				= $resArray["PAYMENTINFO_0_TAXAMT"];  // Tax charged on the transaction.
		//	$exchangeRate		= $resArray["PAYMENTINFO_0_EXCHANGERATE"];  // Exchange rate if a currency conversion occurred. Relevant only if your are billing in their non-primary currency. If the customer chooses to pay with a currency other than the non-primary currency, the conversion occurs in the customer's account.

			/*
			 ' Status of the payment:
			 'Completed: The payment has been completed, and the funds have been added successfully to your account balance.
			 'Pending: The payment is pending. See the PendingReason element for more information.
			 */

			$paymentStatus = $resArray["PAYMENTINFO_0_PAYMENTSTATUS"];

			/*
			 'The reason the payment is pending:
			 '  none: No pending reason
			 '  address: The payment is pending because your customer did not include a confirmed shipping address and your Payment Receiving Preferences is set such that you want to manually accept or deny each of these payments. To change your preference, go to the Preferences section of your Profile.
			 '  echeck: The payment is pending because it was made by an eCheck that has not yet cleared.
			 '  intl: The payment is pending because you hold a non-U.S. account and do not have a withdrawal mechanism. You must manually accept or deny this payment from your Account Overview.
			 '  multi-currency: You do not have a balance in the currency sent, and you do not have your Payment Receiving Preferences set to automatically convert and accept this payment. You must manually accept or deny this payment.
			 '  verify: The payment is pending because you are not yet verified. You must verify your account before you can accept this payment.
			 '  other: The payment is pending for a reason other than those listed above. For more information, contact PayPal customer service.
			 */

			$pendingReason = $resArray["PAYMENTINFO_0_PENDINGREASON"];

			/*
			 'The reason for a reversal if TransactionType is reversal:
			 '  none: No reason code
			 '  chargeback: A reversal has occurred on this transaction due to a chargeback by your customer.
			 '  guarantee: A reversal has occurred on this transaction due to your customer triggering a money-back guarantee.
			 '  buyer-complaint: A reversal has occurred on this transaction due to a complaint about the transaction from your customer.
			 '  refund: A reversal has occurred on this transaction because you have given the customer a refund.
			 '  other: A reversal has occurred on this transaction due to a reason not listed above.
			 */

			$reasonCode	= $resArray["PAYMENTINFO_0_REASONCODE"];

			// Add javascript to close Digital Goods frame. You may want to add more javascript code to
			// display some info message indicating status of purchase in the parent window

			$orderTime = date('Y-m-d H:i:s', strtotime($orderTime));

			return $this->clearPayPalToken($token, $transactionId, $finalPaymentAmount, $orderTime);

		}
		else
		{
			//Display a user friendly Error on the page using any of the following error information returned by PayPal
			$ErrorCode = urldecode($resArray["L_ERRORCODE0"]);
			$ErrorShortMsg = urldecode($resArray["L_SHORTMESSAGE0"]);
			$ErrorLongMsg = urldecode($resArray["L_LONGMESSAGE0"]);
			$ErrorSeverityCode = urldecode($resArray["L_SEVERITYCODE0"]);

			$errorString = "Error at PayPalConfirm at PaymentModel - DoExpressCheckoutDetails API call failed. ";
			$errorString .= "Detailed Error Message: " . $ErrorLongMsg;
			$errorString .= "Short Error Message: " . $ErrorShortMsg;
			$errorString .= "Error Code: " . $ErrorCode;
			$errorString .= "Error Severity Code: " . $ErrorSeverityCode;

			$_SESSION['PaymentError'] = 'Payment was not successful.';
			error_log($errorString);
			return false;

		}
	}

	private function logPayPalInitiation($tokenID, $UserID) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("INSERT INTO PayPalTokens (Token, UserID) VALUES(?, ?);");
		$databaseStatement->bindParam(1, $tokenID);
		$databaseStatement->bindParam(2, $UserID);

		$databaseStatement->execute();
	}

	private function clearPayPalToken($TokenID, $TransactionID, $PaymentAmount, $OrderTime) {

		$link = DBConnectionModel::mainDBLink();

		$databaseStatement = $link->prepare("SELECT * FROM PayPalTokens WHERE Token = ?");
		$databaseStatement->bindParam(1, $TokenID);
		$databaseStatement->setFetchMode(\PDO::FETCH_ASSOC);
		$databaseStatement->execute();

		$row = $databaseStatement->fetch();

		if(!isset($row['Token']) || $row['Token'] == null || $row['Cleared'] == true) { $_SESSION['PaymentError'] = 'Token is already cleared.'; return false; }

		$UserID = $row['UserID'];

		$databaseStatement = $link->prepare("UPDATE PayPalTokens SET Cleared = 1 WHERE Token = ?");
		$databaseStatement->bindParam(1, $TokenID);
		$databaseStatement->execute();

		$databaseStatement = $link->prepare("INSERT INTO PayPalOperations (UserID, PaymentAmount, OrderTime, TransactionID)
																										VALUES(?, ?, ?, ?)");
		$statementArray = array($UserID, $PaymentAmount, $OrderTime, $TransactionID);
		$databaseStatement->execute($statementArray);

		UserOperationsModel::grantEarlyAccessLicense($UserID);

		return true;
	}

}