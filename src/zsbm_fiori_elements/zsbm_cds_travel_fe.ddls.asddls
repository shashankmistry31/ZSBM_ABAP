@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fiori Elements Travel App'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true
@UI.headerInfo: {
    typeName: 'Travel',
    typeNamePlural: 'Travels'

}
define view entity ZSBM_CDS_TRAVEL_FE
  as select from /dmo/travel
{
      @UI.facet: [{
          id : 'travel',
          purpose: #STANDARD,
          position: 10,
          label: 'Travel Information',
          type: #IDENTIFICATION_REFERENCE
      },
      {
          id : 'travel2',
          purpose: #STANDARD,
          position: 20,
          label: 'Travel Part 2 Information',
          type: #IDENTIFICATION_REFERENCE,
          targetQualifier: 'Test'
          }
          ,
          {
          id : 'travel3',
          purpose: #STANDARD,
          position: 20,
          label: 'Update Information',
          type: #IDENTIFICATION_REFERENCE,
          targetQualifier: 'update'
          }


      ]

      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key travel_id     as TravelId,
      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position: 20 }]
      @Consumption.valueHelpDefinition: [{
          entity: {
          name: '/DMO/I_Agency_StdVH',
          element: 'AgencyID'
      }
      }]
      @UI.identification: [{ position: 10 }]
      agency_id     as AgencyId,
      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [{ position: 30 }]
      @UI.identification: [{ position: 20 }]
      customer_id   as CustomerId,
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 20 }]
      begin_date    as BeginDate,
      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 30 }]
      end_date      as EndDate,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 40 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 50 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      @UI.lineItem: [{ position: 80 }]
      currency_code as CurrencyCode,
      @UI.lineItem: [{ position: 90 }]
      @UI.identification: [{ qualifier: 'Test',position: 10}]
      description   as Description,
      @UI.lineItem: [{ position: 100 }]
      @UI.identification: [{ qualifier: 'Test',position: 20}]
      //      @ObjectModel.text.element: [ '' ]
      status        as Status,
      @UI.lineItem: [{ position: 110 }]
      @UI.identification: [{ qualifier: 'update',position: 20}]
      createdby     as Createdby,
      @UI.identification: [{ qualifier: 'update',position: 20}]
      createdat     as Createdat,
      @UI.identification: [{ qualifier: 'update',position: 20}]
      lastchangedby as Lastchangedby,
      @UI.identification: [{ qualifier: 'update',position: 20}]
      lastchangedat as Lastchangedat
}
