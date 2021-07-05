package com.vegetarian.serviceImpl;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.vegetarian.dao.InvoiceDao;
import com.vegetarian.dao.ItemDao;
import com.vegetarian.dao.ProductDao;
import com.vegetarian.dao.UserDao;
import com.vegetarian.entity.Invoice;
import com.vegetarian.service.PayPalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PaypalServiceImpl implements PayPalService {
    @Autowired
    private APIContext apiContext;
    // convert vnd to usd div DOLLAR
    private final int DOLLAR = 22000;
    @Autowired
    private InvoiceDao invoiceDao;
    @Autowired
    private ItemDao itemDao;


    @Override
    public String authorizePayment(com.vegetarian.entity.Invoice invoice,String successURL,String cancelURL) throws PayPalRESTException {
        Payer payer = getPayerInfo(invoice);
        RedirectUrls redirectUrls = getRedirectUrls(successURL,cancelURL);
        List<Transaction> transactions = getTransactionInformation(invoice);
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(transactions)
                .setRedirectUrls(redirectUrls)
                .setPayer(payer)
                .setIntent("authorize");
        Payment approvedPayment = requestPayment.create(apiContext);
        return getApprovalLink(approvedPayment);
    }
    @Override
    public String getApprovalLink(Payment approvedPayment){
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
        for(Links link : links){
            if(link.getRel().equals("approval_url")){
                approvalLink = link.getHref();
            }
        }
        return approvalLink;
    }
    @Override
    public RedirectUrls getRedirectUrls(String successURL,String cancelURL) {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelURL);
        redirectUrls.setReturnUrl(successURL);
        return redirectUrls;
    }

    @Override
    public Payment getPaymentDetail(String paymentId) throws PayPalRESTException {
        return Payment.get(apiContext,paymentId);
    }

    @Override
    public List<Transaction> getTransactionInformation(com.vegetarian.entity.Invoice invoice){
        Details detail = new Details();
        detail.setShipping("0.0");
        detail.setTax("0.0");
        detail.setShippingDiscount("0.0");
        detail.setSubtotal(String.format("%.2f",invoice.getSubTotal()/DOLLAR));
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setDetails(detail);
        amount.setTotal(String.format("%.2f",invoice.getTotal()/DOLLAR));
        Transaction transaction = new Transaction();
        transaction.setDescription(invoice.getDescription());
        transaction.setAmount(amount);
        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);
        return transactions;
    }
    @Override
    public Payer getPayerInfo(com.vegetarian.entity.Invoice invoice) {
        Payer payer = new Payer();
        String []fullName = invoice.getUser().getName().split(" ",3);
        payer.setPaymentMethod(invoice.getPayMethod());
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(fullName[0])
                .setMiddleName(fullName[1])
                .setLastName(fullName[2])
                .setEmail(invoice.getUser().getEmail());
        payer.setPayerInfo(payerInfo);
        return payer;
    }

    @Override
    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException{
        Payment payment = new Payment();
        payment.setId(paymentId);
        PaymentExecution paymentExecute = new PaymentExecution();
        paymentExecute.setPayerId(payerId);
        return payment.execute(apiContext, paymentExecute);
    }
}
