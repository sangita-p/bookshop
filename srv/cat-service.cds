using { sap.capire.bookshop as my } from '../db/schema';
service CatalogService @(path:'/browse') {

  @readonly entity Books as SELECT from my.Books { *,
  } excluding { createdBy, modifiedBy };

}

annotate CatalogService.Books with @(
    UI: {

        LineItem: [
            {$Type : 'UI.DataField', Value: ID},
            {$Type : 'UI.DataField', Value: title},
            {$Type : 'UI.DataField', Value: descr},
            {$Type : 'UI.DataField', Value: stock},
            {$Type : 'UI.DataField', Value: price},
            {$Type : 'UI.DataField', Value: currency_code}
        ],           
    }
);

annotate CatalogService.Books with {
    ID @title:'ID';
    title @title:'Title';
    descr @title: 'Description'; 
    stock @title: 'Stock';
    price @title: 'Price';
    currency_code @title: 'Currency';
}