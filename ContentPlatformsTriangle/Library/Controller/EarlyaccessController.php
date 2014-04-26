<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class EarlyaccessController extends GenericController implements EarlyaccessControllerInterface {

	public function index() {

		$HasEarlyAccess = false;

		if(isset($_SESSION['Username']) && $_SESSION['Username'] && !is_null($_SESSION['Username']) && $_SESSION['Username'] != "") {

			$UserID = \Model\UserOperationsModel::IDFromUsername($_SESSION['Username']);
			$HasEarlyAccess = \Model\UserOperationsModel::ownsEarlyAccessLicense($UserID);
		}

		if($HasEarlyAccess) { $myView = new \View\DownloadView(); } else {

			$myView = new \View\EarlyaccessView();

			$EarlyAccessLicenses = \Model\GenericOperationsModel::GetEarlyAccessLicensesLeft();
			$myView->passesLeft = $EarlyAccessLicenses;
		}

		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}

	public function PayPalInitiate() {

		$paymentModel = new \Model\PaymentModel();
		$myView = new \View\EarlyaccessView();
		$myView->setAvatarLink($this->AvatarLink);

		if(!isset($_POST['PriceField'])) { header('Location:../'); }
		$price = $_POST['PriceField'];

		if(!is_numeric($price)) {
			$_SESSION['PaymentError'] = 'Price value is not numeric.';
			$myView->setPaymentNotification(2);
			$myView->initContent();
			echo $myView->run();
		}

		$price = (double)$price;

		if($price < 4.99) {
			$_SESSION['PaymentError'] = 'Price value is less than $4.99.';
			$myView->setPaymentNotification(2);
			$myView->initContent();
			echo $myView->run();
		}

		if(!$paymentModel->PayPalInitiate($price)) {

			$myView->setPaymentNotification(2);
			$myView->initContent();
			echo $myView->run();
		}
	}

	public function PayPalConfirm() {

		$paymentModel = new \Model\PaymentModel();
		$myView = new \View\EarlyaccessView();
		$myView->setAvatarLink($this->AvatarLink);
		$EarlyAccessLicenses = \Model\GenericOperationsModel::GetEarlyAccessLicensesLeft();
		$myView->passesLeft = $EarlyAccessLicenses;

		if($paymentModel->PayPalConfirm()) {
			$myView->setPaymentNotification(1);
			$myView->initContent();
			echo $myView->run(); }
		
		else {
			$myView->setPaymentNotification(2);
			$myView->initContent();
			echo $myView->run(); }
	}

}

?>