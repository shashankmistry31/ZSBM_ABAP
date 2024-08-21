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
@UI.selectionVariant: [
  {
    text: 'Expensive',
    qualifier: 'Expensive'
  },
    {
    text: 'Cheap',
    qualifier: 'Default'
  }
]
@UI.selectionPresentationVariant: [{
  id: '',
  text: 'Cheap',
  selectionVariantQualifier: 'Default',
  presentationVariantQualifier: 'Default',
  qualifier: 'Cheap'
}]
@UI.presentationVariant: [
  {
    qualifier: 'Default',
    sortOrder: [{by: 'TotalPrice', direction: #ASC }]
  }
]
define view entity ZSBM_CDS_TRAVEL_FE
  as select from /dmo/travel
  /* Composition with Booking Id */
  association [1..*] to ZSBM_I_DMO_BKNG_R as _booking on $projection.TravelId = _booking.TravelId
{
      @UI.facet: [{
          id : 'travel',
          purpose: #STANDARD,
          position: 10,
          label: 'Travel Info',
          type: #IDENTIFICATION_REFERENCE
        },
        {
          id : 'travel2',
          purpose: #STANDARD,
          position: 20,
          label: 'Fees Info',
          type: #IDENTIFICATION_REFERENCE,
          targetQualifier: 'travel2'
        },
         {
          id : 'travel3',
          purpose: #STANDARD,
          position: 30,
          label: 'Update Info',
          type: #IDENTIFICATION_REFERENCE,
          targetQualifier: 'travel3'
          },
          {
          id: 'Booking',
          purpose: #STANDARD,
          position: 40,
          label: 'Bookings',
          type: #LINEITEM_REFERENCE ,
          targetElement: '_booking'
      }
      ]


      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key travel_id                            as TravelId,
      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position: 20 }]
      @Consumption.valueHelpDefinition: [{
          entity: {
          name: '/DMO/I_Agency_StdVH',
          element: 'AgencyID'
      }
      }]
      @UI.identification: [{ position: 10 }]
      agency_id                            as AgencyId,
      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [{ position: 30 }]
      @UI.identification: [{ position: 20 }]
      customer_id                          as CustomerId,
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 20 }]
      begin_date                           as BeginDate,
      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 30 }]
      end_date                             as EndDate,
      @UI.lineItem: [{ position: 51 }]
      @UI.identification: [{ position: 31 }]
      /* wanted format in the DD-MMM-YYYY format */
      case substring( end_date , 5 , 2 )
      when '12'
      then  ltrim ( concat ( concat( substring( end_date , 7 , 2 ) ,'-Dec-'  ) , substring( end_date , 1 , 4 ) ) ,  '0' )
      when '11'
      then concat ( concat( substring( end_date , 7 , 2 ) ,'-Nov-'  ) , substring( end_date , 1 , 4 ) )
      else 'Default'
      end                                  as EndDateConverted,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 10 ,qualifier: 'travel2'}]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee                          as BookingFee,
      @UI.lineItem: [{ position: 70 }]
      @UI.identification: [{ position: 20 , qualifier: 'travel2' }]
      //      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(  total_price  as abap.int8   ) as TotalPrice,
      //      total_price   as TotalPrice,
      //      cast(  get_numeric_value( total_price )  as abap.int8   ) as TotalPrice,

      //      decimal_shift( amount => total_price,
      //                     currency => cast( '0 ' as abap.cuky(5) ),
      //                     error_handling => 'SET_TO_NULL' ) as shift_0,
      //      @UI.lineItem: [{ position: 80 }]
      currency_code                        as CurrencyCode,
      @UI.lineItem: [{ position: 90 }]
      @UI.identification: [{ position: 40}]
      description                          as Description,
      @UI.lineItem: [{ position: 100 }]
      @UI.identification: [{ position: 50}]
      //      @ObjectModel.text.element: [ '' ]
      status                               as Status,
      @UI.lineItem: [{ position: 110 }]
      @UI.identification: [{ qualifier: 'travel3',position: 10}]
      createdby                            as Createdby,
      @UI.identification: [{ qualifier: 'travel3',position: 20}]
      createdat                            as Createdat,
      @UI.identification: [{ qualifier: 'travel3',position: 30}]
      lastchangedby                        as Lastchangedby,
      @UI.identification: [{ qualifier: 'travel3',position: 40}]
      lastchangedat                        as Lastchangedat,


      /* Composition */
      _booking

}
