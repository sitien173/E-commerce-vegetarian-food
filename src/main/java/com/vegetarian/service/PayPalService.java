package com.vegetarian.service;
import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
import com.vegetarian.entity.Invoice;

import java.util.List;

public interface PayPalService {
    String authorizePayment(com.vegetarian.entity.Invoice invoice, String successURL, String cancelURL) throws PayPalRESTException;
    RedirectUrls getRedirectUrls(String successURL,String cancelURL);
    Payment getPaymentDetail(String paymentId) throws PayPalRESTException;
    Payer getPayerInfo(com.vegetarian.entity.Invoice invoice);
    String getApprovalLink(Payment approvedPayment);
    List<Transaction> getTransactionInformation(com.vegetarian.entity.Invoice invoice);
    Payment executePayment(String paymentId, String payerId) throws PayPalRESTException;
}
