<?php

namespace Model;

interface PaymentModelInterface {
	public function PayPalInitiate($paymentAmount);
}

?>