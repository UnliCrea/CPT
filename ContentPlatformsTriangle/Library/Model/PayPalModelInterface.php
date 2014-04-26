<?php

namespace Model;

interface PayPalModelInterface {
	public function RedirectToPayPal ($token);
	public function ConfirmPayment($token, $paymentType, $currencyCodeType, $payerID, $FinalPaymentAmt, $items);
	public function SetExpressCheckoutDG($paymentAmount, $currencyCodeType, $paymentType, $returnURL, $cancelURL, $items);
	public function GetExpressCheckoutDetails($token);
}

?>