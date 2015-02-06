//
//  GlobalModalObjects.m
//  Hema
//
//  Created by Mac on 19/01/15.
//  Copyright (c) 2015 Hema. All rights reserved.
//

#import "GlobalModelObjects.h"

@implementation BookingListObjects

-(id)initWithBookingListId:(NSString *)ParamBookingListId
                  Category:(NSString *)ParamCategory
                      Name:(NSString *)ParamName
                 StartDate:(NSString *)ParamStartDate
                   EndDate:(NSString *)ParamEndDate
                EventPlace:(NSString *)ParamEventPlace
          ShortDescription:(NSString *)ParamShortDescription
{
    self = [super init];
    if (self) {
        self.BookingListId          = ParamBookingListId;
        self.Category               = ParamCategory;
        self.Name                   = ParamName;
        self.StartDate              = ParamStartDate;
        self.EndDate                = ParamEndDate;
        self.EventPlace             = ParamEventPlace;
        self.ShortDescription       = ParamShortDescription;
    }
    return self;
}

-(id)initWithBookingListId:(NSString *)ParamBookingListId
                  Category:(NSString *)ParamCategory
                      Name:(NSString *)ParamName
                 StartDate:(NSString *)ParamStartDate
                   EndDate:(NSString *)ParamEndDate
                EventPlace:(NSString *)ParamEventPlace
          ShortDescription:(NSString *)ParamShortDescription
             EventLocation:(NSString *)ParamEventLocation
{
    self = [super init];
    if (self) {
        self.BookingListId      = ParamBookingListId;
        self.Category           = ParamCategory;
        self.Name               = ParamName;
        self.StartDate          = ParamStartDate;
        self.EndDate            = ParamEndDate;
        self.EventPlace         = ParamEventPlace;
        self.ShortDescription   = ParamShortDescription;
        self.EventLocation      = ParamEventLocation;
    }
    return self;
}

@end

@implementation ProviderAccountDetails

-(id)initWithAllowAdvanceOrder:(NSString *)ParamAllowAdvanceOrder
                  BusinessDays:(NSString *)ParamBusinessDays
                 BusinessHours:(NSString *)ParamBusinessHours
                    CurrencyId:(NSString *)ParamCurrencyId
                DeliveryCharge:(NSString *)ParamDeliveryCharge
                  DeliveryMode:(NSString *)ParamDeliveryMode
                   Description:(NSString *)ParamDescription
                          Logo:(NSString *)ParamLogo
               MaxBillingValue:(NSString *)ParamMaxBillingValue
               MinBillingValue:(NSString *)ParamMinBillingValue
               MinDeliveryTime:(NSString *)ParamMinDeliveryTime
                          Name:(NSString *)ParamName
                         Phone:(NSString *)paramPhone
                     Questions:(NSString *)ParamQuestions
                      SalesTax:(NSString *)ParamSalesTax
                    ServiceTax:(NSString *)paramServiceTax
                           Vat:(NSString *)ParamVat
                       Website:(NSString *)paramWebsite
{
    self = [super init];
    if (self) {
        self.AllowAdvanceOrder          = ParamAllowAdvanceOrder;
        self.BusinessDays               = ParamBusinessDays;
        self.BusinessHours              = ParamBusinessHours;
        self.CurrencyId                 = ParamCurrencyId;
        self.DeliveryCharge             = ParamDeliveryCharge;
        self.DeliveryMode               = ParamDeliveryMode;
        self.Description                = ParamDescription;
        self.Logo                       = ParamLogo;
        self.MaxBillingValue            = ParamMaxBillingValue;
        self.MinBillingValue            = ParamMinBillingValue;
        self.MinDeliveryTime            = ParamMinDeliveryTime;
        self.Name                       = ParamName;
        self.Phone                      = paramPhone;
        self.Questions                  = ParamQuestions;
        self.SalesTax                   = ParamSalesTax;
        self.ServiceTax                 = paramServiceTax;
        self.Vat                        = ParamVat;
        self.Website                    = paramWebsite;
    }
    return self;
}

@end

@implementation ProviderViewServicesList

-(id)initWithServiceId:(NSString *)ParamServiceId
           ServiceName:(NSString *)ParamServiceName
ServiceShortDescription:(NSString *)ParamServiceShortDescription
           ServiceRate:(NSString *)ParamServiceRate
   ServiceCurrencyCode:(NSString *)ParamServiceCurrencyCode
  ServiceRateValidTill:(NSString *)ParamServiceRateValidTill
            ServiceTax:(NSString *)ParamServiceTax
       ServiceDiscount:(NSString *)ParamServiceDiscount
   ServiceShippingCost:(NSString *)ParamServiceShippingCost
{
    self = [super init];
    if (self) {
        self.ServiceId                      = ParamServiceId;
        self.ServiceName                    = ParamServiceName;
        self.ServiceShortDescription        = ParamServiceShortDescription;
        self.ServiceRate                    = ParamServiceRate;
        self.ServiceCurrencyCode            = ParamServiceCurrencyCode;
        self.ServiceRateValidTill           = ParamServiceRateValidTill;
        self.ServiceTax                     = ParamServiceTax;
        self.ServiceDiscount                = ParamServiceDiscount;
        self.ServiceShippingCost            = ParamServiceShippingCost;
    }
    return self;
}

@end

@implementation ServiceCategory

-(id)initWithCategoryId:(NSString *)ParamCategoryId
CategoryName:(NSString *)ParamCategoryName
{
    self = [super init];
    if (self) {
        self.CategoryId         = ParamCategoryId;
        self.CategoryName       = ParamCategoryName;
    }
    return self;
}

@end

@implementation ProviderMYQuotationList

-(id)initWithQuotationId:(NSString *)ParamQuotationId
       QuotationModuleId:(NSString *)ParamQuotationModuleId
     QuotationModuleName:(NSString *)ParamQuotationModuleName
      QuotationBidAmount:(NSString *)ParamQuotationBidAmount
      QuotationStartDate:(NSString *)ParamQuotationStartDate
        QuotationEndDate:(NSString *)ParamQuotationEndDate
       QuotationDuration:(NSString *)ParamQuotationDuration
           QuotationNote:(NSString *)ParamQuotationNote
      QuotationIsBlocked:(NSString *)ParamQuotationIsBlocked
      QuotationIsAwarded:(NSString *)ParamQuotationIsAwarded
     QuotationIsDeclined:(NSString *)ParamQuotationIsDeclined
     QuotationIsRevision:(NSString *)ParamQuotationIsRevision
  QuotationQuotationTime:(NSString *)ParamQuotationQuotationTime
  QuotationBookingNumber:(NSString *)ParamQuotationBookingNumber
  QuotationBookingIsPaid:(NSString *)ParamQuotationBookingIsPaid
{
    self = [super init];
    if (self) {
        self.QuotationId            = ParamQuotationId;
        self.QuotationModuleId      = ParamQuotationModuleId;
        self.QuotationModuleName    = ParamQuotationModuleName;
        self.QuotationBidAmount     = ParamQuotationBidAmount;
        self.QuotationStartDate     = ParamQuotationStartDate;
        self.QuotationEndDate       = ParamQuotationEndDate;
        self.QuotationDuration      = ParamQuotationDuration;
        self.QuotationNote          = ParamQuotationNote;
        self.QuotationIsBlocked     = ParamQuotationIsBlocked;
        self.QuotationIsAwarded     = ParamQuotationIsAwarded;
        self.QuotationIsDeclined    = ParamQuotationIsDeclined;
        self.QuotationIsRevision    = ParamQuotationIsRevision;
        self.QuotationQuotationTime = ParamQuotationQuotationTime;
        self.QuotationBookingNumber = ParamQuotationBookingNumber;
        self.QuotationBookingIsPaid = ParamQuotationBookingIsPaid;
    }
    return self;
}

@end

@implementation ProverHistoryOfConversion

-(id)initWithConversionId:(NSString *)ParamConversionId
ConversionReplyCount:(NSString *)ParamConversionReplyCount
ConversionProviderId:(NSString *)ParamConversionProviderId
ConversionMessageTitle:(NSString *)ParamConversionMessageTitle
ConversionMessageDetails:(NSString *)ParamConversionMessageDetails
ConversionMessageTime:(NSString *)ParamConversionMessageTime
ConversionIsBlocked:(NSString *)ParamConversionIsBlocked
ConversionIsReplied:(NSString *)ParamConversionIsReplied
{
    self = [super init];
    if (self) {
        self.ConversionId                   = ParamConversionId;
        self.ConversionReplyCount           = ParamConversionReplyCount;
        self.ConversionProviderId           = ParamConversionProviderId;
        self.ConversionMessageTitle         = ParamConversionMessageTitle;
        self.ConversionMessageDetails       = ParamConversionMessageDetails;
        self.ConversionMessageTime          = ParamConversionMessageTime;
        self.ConversionIsBlocked            = ParamConversionIsBlocked;
        self.ConversionIsReplied            = ParamConversionIsReplied;
    }
    return self;
}

@end

@implementation ProviderIssueList

-(id)initWithIssueListId:(NSString *)ParamIssueListId
       IssueListModuleId:(NSString *)ParamIssueListModuleId
     IssueListModuleName:(NSString *)ParamIssueListModuleName
      IssueListBidAmount:(NSString *)ParamIssueListBidAmount
      IssueListStartDate:(NSString *)ParamIssueListStartDate
        IssueListEndDate:(NSString *)ParamIssueListEndDate
       IssueListDuration:(NSString *)ParamIssueListDuration
           IssueListNote:(NSString *)ParamIssueListNote
      IssueListIsBlocked:(NSString *)ParamIssueListIsBlocked
      IssueListIsAwarded:(NSString *)ParamIssueListIsAwarded
     IssueListIsDeclined:(NSString *)ParamIssueListIsDeclined
     IssueListIsRevision:(NSString *)ParamIssueListIsRevision
  IssueListQuotationTime:(NSString *)ParamIssueListQuotationTime
  IssueListBookingNumber:(NSString *)ParamIssueListBookingNumber
         IssueListIsPaid:(NSString *)ParamIssueListIsPaid
{
    self = [super init];
    if (self) {
        self.IssueListId            = ParamIssueListId;
        self.IssueListModuleId      = ParamIssueListModuleId;
        self.IssueListModuleName    = ParamIssueListModuleName;
        self.IssueListBidAmount     = ParamIssueListBidAmount;
        self.IssueListStartDate     = ParamIssueListStartDate;
        self.IssueListEndDate       = ParamIssueListEndDate;
        self.IssueListDuration      = ParamIssueListDuration;
        self.IssueListNote          = ParamIssueListNote;
        self.IssueListIsBlocked     = ParamIssueListIsBlocked;
        self.IssueListIsAwarded     = ParamIssueListIsAwarded;
        self.IssueListIsDeclined    = ParamIssueListIsDeclined;
        self.IssueListIsRevision    = ParamIssueListIsRevision;
        self.IssueListQuotationTime = ParamIssueListQuotationTime;
        self.IssueListBookingNumber = ParamIssueListBookingNumber;
        self.IssueListIsPaid        = ParamIssueListIsPaid;
    }
    return self;
}

@end

@implementation ProviderQuotationRequest

-(id)initWithQuotationId:(NSString *)ParamQuotationId
        QuotationEventId:(NSString *)ParamQuotationEventId
     QuotationModuleName:(NSString *)ParamQuotationModuleName
  QuotationModuleDetails:(NSString *)ParamQuotationModuleDetails
      QuotationStartDate:(NSString *)ParamQuotationStartDate
        QuotationEndDate:(NSString *)ParamQuotationEndDate
         QuotationBudget:(NSString *)ParamQuotationBudget
   QuotationCurrencyCode:(NSString *)ParamQuotationCurrencyCode
       QuotationDuration:(NSString *)paramQuotationDuration
{
    self = [super init];
    if (self) {
        self.QuotationId            = ParamQuotationId;
        self.QuotationEventId       = ParamQuotationEventId;
        self.QuotationModuleName    = ParamQuotationModuleName;
        self.QuotationModuleDetails = ParamQuotationModuleDetails;
        self.QuotationStartDate     = ParamQuotationStartDate;
        self.QuotationEndDate       = ParamQuotationEndDate;
        self.QuotationBudget        = ParamQuotationBudget;
        self.QuotationCurrencyCode  = ParamQuotationCurrencyCode;
        self.QuotationDuration      = paramQuotationDuration;
    }
    return self;
}

@end

@implementation ProviderQuotationDetails

-(id)initWithQDetailsId:(NSString *)ParamQDetailsId
     QDetailsModuleName:(NSString *)ParamQDetailsModuleName
  QDetailsModuleDetails:(NSString *)ParamQDetailsModuleDetails
      QDetailsStartDate:(NSString *)ParamQDetailsStartDate
        QDetailsEndDate:(NSString *)ParamQDetailsEndDate
         QDetailsBudget:(NSString *)ParamQDetailsBudget
       QDetailsCurrency:(NSString *)ParamQDetailsCurrency
       QDetailsDuration:(NSString *)ParamQDetailsDuration
       QDetailsLocation:(NSString *)ParamQDetailsLocation
{
    self = [super init];
    if (self) {
        self.QDetailsId             = ParamQDetailsId;
        self.QDetailsModuleName     = ParamQDetailsModuleName;
        self.QDetailsModuleDetails  = ParamQDetailsModuleDetails;
        self.QDetailsStartDate      = ParamQDetailsStartDate;
        self.QDetailsEndDate        = ParamQDetailsEndDate;
        self.QDetailsBudget         = ParamQDetailsBudget;
        self.QDetailsCurrency       = ParamQDetailsCurrency;
        self.QDetailsDuration       = ParamQDetailsDuration;
        self.QDetailsLocation       = ParamQDetailsLocation;
    }
    return self;
}

@end

@implementation ProviderServiceDetails

-(id)initWithSDetailsId:(NSString *)ParamSDetailsId
     SDetailsProviderId:(NSString *)ParamSDetailsProviderId
           SDetailsName:(NSString *)ParamSDetailsName
SDetailsShortDescription:(NSString *)ParamSDetailsShortDescription
SDetailsFullDescription:(NSString *)ParamSDetailsFullDescription
           SDetailsRate:(NSString *)ParamSDetailsRate
SDetailsServiceCategory:(NSString *)ParamSDetailsServiceCategory
   SDetailsCategoryName:(NSString *)ParamSDetailsCategoryName
   SDetailsCurrencyCode:(NSString *)ParamSDetailsCurrencyCode
           SDetailsLogo:(NSString *)ParamSDetailsLogo
  SDetailsRateValidTill:(NSString *)ParamSDetailsRateValidTill
            SDetailsTax:(NSString *)ParamSDetailsTax
  SDetailsAllowDiscount:(NSString *)ParamSDetailsAllowDiscount
       SDetailsDiscount:(NSString *)ParamSDetailsDiscount
       SDetailsShipping:(NSString *)ParamSDetailsShipping
   SDetailsShippingCost:(NSString *)ParamSDetailsShippingCost
{
    self = [super init];
    if (self) {
        self.SDetailsId                 = ParamSDetailsId;
        self.SDetailsProviderId         = ParamSDetailsProviderId;
        self.SDetailsName               = ParamSDetailsName;
        self.SDetailsShortDescription   = ParamSDetailsShortDescription;
        self.SDetailsFullDescription    = ParamSDetailsFullDescription;
        self.SDetailsRate               = ParamSDetailsRate;
        self.SDetailsServiceCategory    = ParamSDetailsServiceCategory;
        self.SDetailsCategoryName       = ParamSDetailsCategoryName;
        self.SDetailsCurrencyCode       = ParamSDetailsCurrencyCode;
        self.SDetailsLogo               = ParamSDetailsLogo;
        self.SDetailsRateValidTill      = ParamSDetailsRateValidTill;
        self.SDetailsTax                = ParamSDetailsTax;
        self.SDetailsAllowDiscount      = ParamSDetailsAllowDiscount;
        self.SDetailsDiscount           = ParamSDetailsDiscount;
        self.SDetailsShipping           = ParamSDetailsShipping;
        self.SDetailsShippingCost       = ParamSDetailsShippingCost;
    }
    return self;
}

@end

@implementation CustomerNotificationList

-(id)initWithCNotificationId:(NSString *)ParamCNotificationId
          CNotificationTitle:(NSString *)ParamCNotificationTitle
     CNotificationCustomerId:(NSString *)ParamCNotificationCustomerId
        CNotificationEventId:(NSString *)ParamCNotificationEventId
   CNotificationIsCompleated:(NSString *)ParamCNotificationIsCompleated
CNotificationNotificationComment:(NSString *)ParamCNotificationNotificationComment
CNotificationNotificationTime:(NSString *)ParamCNotificationNotificationTime
      CNotificationIsBlocked:(NSString *)ParamCNotificationIsBlocked
         CNotificationIsRead:(NSString *)ParamCNotificationIsRead
{
    self = [super init];
    if (self) {
        self.CNotificationId            = ParamCNotificationId;
        self.CNotificationTitle         = ParamCNotificationTitle;
        self.CNotificationCustomerId    = ParamCNotificationCustomerId;
        self.CNotificationEventId       = ParamCNotificationEventId;
        self.CNotificationIsCompleated  = ParamCNotificationIsCompleated;
        self.CNotificationNotificationComment   = ParamCNotificationNotificationComment;
        self.CNotificationNotificationTime  = ParamCNotificationNotificationTime;
        self.CNotificationIsBlocked     = ParamCNotificationIsBlocked;
        self.CNotificationIsRead        = ParamCNotificationIsRead;
    }
    return self;
}

@end


@implementation CustomerHistoryOfConversionList

-(id)initWithCHistoryOfConversionId:(NSString *)ParamCHistoryOfConversionId
     CHistoryOfConversionReplyCount:(NSString *)ParamCHistoryOfConversionReplyCount
     CHistoryOfConversionCustomerId:(NSString *)ParamCHistoryOfConversionCustomerId
   CHistoryOfConversionMessageTitle:(NSString *)ParamCHistoryOfConversionMessageTitle
 CHistoryOfConversionMessageDetails:(NSString *)ParamCHistoryOfConversionMessageDetails
    CHistoryOfConversionMessageTime:(NSString *)ParamCHistoryOfConversionMessageTime
      CHistoryOfConversionIsBlocked:(NSString *)ParamCHistoryOfConversionIsBlocked
      CHistoryOfConversionIsReplied:(NSString *)ParamCHistoryOfConversionIsReplied
{
    self = [super init];
    if (self) {
        self.CHistoryOfConversionId             = ParamCHistoryOfConversionId;
        self.CHistoryOfConversionReplyCount     = ParamCHistoryOfConversionReplyCount;
        self.CHistoryOfConversionCustomerId     = ParamCHistoryOfConversionCustomerId;
        self.CHistoryOfConversionMessageTitle   = ParamCHistoryOfConversionMessageTitle;
        self.CHistoryOfConversionMessageDetails = ParamCHistoryOfConversionMessageDetails;
        self.CHistoryOfConversionMessageTime    = ParamCHistoryOfConversionMessageTime;
        self.CHistoryOfConversionIsBlocked      = ParamCHistoryOfConversionIsBlocked;
        self.CHistoryOfConversionIsReplied      = ParamCHistoryOfConversionIsReplied;
    }
    return self;
}

@end

@implementation CustomerCompletedEventList

-(id)initWithCCompletedEventId:(NSString *)ParamCCompletedEventId
     CCompletedEventCustomerId:(NSString *)ParamCCompletedEventCustomerId
          CCompletedEventTitle:(NSString *)ParamCCompletedEventTitle
    CCompletedEventCompanyName:(NSString *)ParamCCompletedEventCompanyName
    CCompletedEventContactName:(NSString *)ParamCCompletedEventContactName
          CCompletedEventPhone:(NSString *)ParamCCompletedEventPhone
   CCompletedEventEmailAddress:(NSString *)ParamCCompletedEventEmailAddress
       CCompletedEventDateForm:(NSString *)ParamCCompletedEventDateForm
         CCompletedEventDateTo:(NSString *)ParamCCompletedEventDateTo
    CCompletedEventIsCompleted:(NSString *)ParamCCompletedEventIsCompleted
{
    self = [super init];
    if (self) {
        self.CCompletedEventId          = ParamCCompletedEventId;
        self.CCompletedEventCustomerId  = ParamCCompletedEventCustomerId;
        self.CCompletedEventTitle       = ParamCCompletedEventTitle;
        self.CCompletedEventCompanyName = ParamCCompletedEventCompanyName;
        self.CCompletedEventContactName = ParamCCompletedEventContactName;
        self.CCompletedEventPhone       = ParamCCompletedEventPhone;
        self.CCompletedEventEmailAddress = ParamCCompletedEventEmailAddress;
        self.CCompletedEventDateForm    = ParamCCompletedEventDateForm;
        self.CCompletedEventDateTo      = ParamCCompletedEventDateTo;
        self.CCompletedEventIsCompleted = ParamCCompletedEventIsCompleted;
    }
    return self;
}

@end

@implementation CustomerFeedBack

-(id)initWithCFeedbackId:(NSString *)ParamCFeedbackId
     CFeedbackCustomerId:(NSString *)ParamCFeedbackCustomerId
        CFeedbackEventId:(NSString *)ParamCFeedbackEventId
          CFeedbackTitle:(NSString *)ParamCFeedbackTitle
         CFeedbackReview:(NSString *)ParamCFeedbackReview
         CFeedbackRating:(NSString *)ParamCFeedbackRating
      CFeedbackIsBlocked:(NSString *)ParamCFeedbackIsBlocked
{
    self = [super init];
    if (self) {
        self.CFeedbackId            = ParamCFeedbackId;
        self.CFeedbackCustomerId    = ParamCFeedbackCustomerId;
        self.CFeedbackEventId       = ParamCFeedbackEventId;
        self.CFeedbackTitle         = ParamCFeedbackTitle;
        self.CFeedbackReview        = ParamCFeedbackReview;
        self.CFeedbackRating        = ParamCFeedbackRating;
        self.CFeedbackIsBlocked     = ParamCFeedbackIsBlocked;
    }
    return self;
}

@end

@implementation CustomerViewHistory

-(id)initWithCViewHistoryId:(NSString *)ParamCViewHistoryId
     CViewHistoryCustomerId:(NSString *)ParamCViewHistoryCustomerId
          CViewHistoryTitle:(NSString *)ParamCViewHistoryTitle
    CViewHistoryCompanyName:(NSString *)ParamCViewHistoryCompanyName
    CViewHistoryContactName:(NSString *)ParamCViewHistoryContactName
          CViewHistoryPhone:(NSString *)ParamCViewHistoryPhone
   CViewHistoryEmailAddress:(NSString *)ParamCViewHistoryEmailAddress
       CViewHistoryDateForm:(NSString *)ParamCViewHistoryDateForm
         CViewHistoryDateTo:(NSString *)ParamCViewHistoryDateTo
    CViewHistoryIsCompleted:(NSString *)ParamCViewHistoryIsCompleted
{
    self = [super init];
    if (self) {
        self.CViewHistoryId             = ParamCViewHistoryId;
        self.CViewHistoryCustomerId     = ParamCViewHistoryCustomerId;
        self.CViewHistoryTitle          = ParamCViewHistoryTitle;
        self.CViewHistoryCompanyName    = ParamCViewHistoryCompanyName;
        self.CViewHistoryContactName    = ParamCViewHistoryContactName;
        self.CViewHistoryPhone          = ParamCViewHistoryPhone;
        self.CViewHistoryEmailAddress   = ParamCViewHistoryEmailAddress;
        self.CViewHistoryDateForm       = ParamCViewHistoryDateForm;
        self.CViewHistoryDateTo         = ParamCViewHistoryDateTo;
        self.CViewHistoryIsCompleted    = ParamCViewHistoryIsCompleted;
    }
    return self;
}

@end
